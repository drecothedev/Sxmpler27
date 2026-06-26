//
//  SessionManager.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/13/26.
//
/*

Description:
This class represents the Session throughout the entire app. `currentSession` represents the current session we are working with. This session may be reset when requested, so that is why we need a current identifier. i used observable so that we can pass the session throughout the views as, they will need to check the state ( given through UploadState ). The state is only updated through the Session class, and shouldn't be updated through view elements like Buttons, .onAppear, etc.
Responsibilities:
    - Load Asset as an AVUrlAsset
    - Create and reset currentSession
    - Manage uploads state
    - Contain results for session
    - Report session errors

Notes:
    - I do plan on optimizing a bit. Moslty in the getResults where i'm calling analyze twice.
    - As of now, will not support any OS under 27.0
*/

import AVFoundation
import Foundation
import MusicUnderstanding

enum SessionErrors: Error {
    case badAsset, noAsset, loading, result, analyzing
}

enum UploadState {
    case empty, selected, analyzing, uploading, failed, completed
}

@available(macOS 27.0, *)
@Observable
class Session {
    var asset: AVURLAsset? = nil
    var uploadStatus: UploadState = .empty
    var currentSession: MusicUnderstandingSession?
    var results: Result?
    
    func loadAsset(with url: URL) {
        asset = AVURLAsset(url: url)
    }
    
    func loadSession() async throws {
        guard let ass = asset else { throw SessionErrors.badAsset }
        currentSession = try await MusicUnderstandingSession(asset: ass)
        guard let currentSession = currentSession else { throw SessionErrors.loading }
    }
    
    func analyzeSession() async throws -> MusicUnderstandingSession.SessionResult {
        uploadStatus = .analyzing
        try await loadSession()
        guard let currentSession = currentSession else { throw SessionErrors.analyzing }
        let results = try await currentSession.analyze()
        
        return results
    }
    
    func getResults() async throws -> Result {
        do {
            let key = try await analyzeSession().key
            let bpm = try await analyzeSession().rhythm
            guard let key = key, let keyFirst = key.ranges.first, let bpm = bpm else { throw SessionErrors.result }
            guard let bpm = bpm.beatsPerMinute else { throw SessionErrors.result }
            let adjustedBpm = bpm * 2
            let keyString = (keyFirst.value.tonic.rawValue + keyFirst.value.mode.rawValue).capitalized
            let bpmString = String(adjustedBpm)
            results = Result(key: keyString, bpm: bpmString)
            uploadStatus = .completed
            return Result(key: keyString, bpm: bpmString)
        } catch {
            uploadStatus = .failed
            throw SessionErrors.analyzing
        }
    }
    
    func resetSession() {
        currentSession = nil
        results = nil
        asset = nil
        uploadStatus = .empty
    }
}
