//
//  SessionManager.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/13/26.
//

import AVFoundation
import Foundation
import MusicUnderstanding

enum SessionErrors: Error {
    case badAsset, noAsset
}

enum UploadState {
    case empty, selected, analyzing, ready, uploading, failed, completed
}

@available(macOS 27.0, *)
@Observable
class Session {
    var asset: AVURLAsset? = nil
    var uploadStatus: UploadState = .empty
    
    func loadAsset(with url: URL) {
        uploadStatus = .uploading
        asset = AVURLAsset(url: url)
        uploadStatus = .selected
    }
    
    func loadSession() async throws -> MusicUnderstandingSession {
        guard let ass = asset else { throw SessionErrors.badAsset }
        var session = try await MusicUnderstandingSession(asset: ass)
        uploadStatus = .ready
        return session
    }
    
    func analyzeSession() async throws {
        uploadStatus = .analyzing
        let session = try await loadSession()
        let results = try await session.analyze()
        let pace = results.pace
        let key = results.key
        
        if let key = key {
            print(key.ranges)
           
        }
        
//        if let pace = pace {
//            print(pace.ranges)
//        }
    }
    
    func showSessionResults(for session: MusicUnderstandingSession) {
        
    }
}
