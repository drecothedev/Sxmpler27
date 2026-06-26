//
//  TypingTextView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/23/26.
//

import SwiftUI

struct TypingTextView: View {
    @State private var displayedText = ""
    
    let text: String
    let speed: Duration
    
    var body: some View {
        Text(displayedText)
            .task {
                while !Task.isCancelled {
                    displayedText = ""

                    for character in text {
                        displayedText.append(character)
                        try? await Task.sleep(for: speed)
                    }

                    try? await Task.sleep(for: .milliseconds(1000))

                    while !displayedText.isEmpty {
                        displayedText.removeLast()
                        try? await Task.sleep(for: speed)
                    }

                    try? await Task.sleep(for: .milliseconds(800))
                }
            }
            .animation(.easeInOut(duration: 0.4), value: displayedText)
    }
}

#Preview {
    TypingTextView(text: "Analyzing audio...", speed: .milliseconds(20))
}


