//
//  UploadView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//

import SwiftUI
import UniformTypeIdentifiers
import AVFoundation

struct UploadView: View {
    @State private var showImporter = false
    @State private var isPulsing = false
    
    var session: Session

    var body: some View {
        Button {
            showImporter = true
        } label: {
            DefaultButtonView(text: "Start")
                .animation(.easeIn(duration: 1.0), value: isPulsing)
        }
        .scaleEffect(isPulsing ? 1.0 : 1.05)
        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isPulsing)
        .onAppear {
            isPulsing = true
        }
        .fileImporter(
            isPresented: $showImporter,
            allowedContentTypes: [.audio],
            allowsMultipleSelection: false
        ) { result in
            do {
                // Handles user file input. Users can only add wav files.
                let urls = try result.get()
                guard let url = urls.first else { return }
                
                let didAccess = url.startAccessingSecurityScopedResource()
                defer {
                    if didAccess {
                        url.stopAccessingSecurityScopedResource()
                    }
                }
                session.uploadStatus = .selected
                session.loadAsset(with: url)
                
                Task {
                    do {
                        _ = try await session.loadSession()
                    } catch {
                        print("Error with session: \(error)")
                    }
                }
            } catch {
                print("Import failed:", error)
            }
        }
        
    }
}


#Preview {
    UploadView(session: Session())
}
