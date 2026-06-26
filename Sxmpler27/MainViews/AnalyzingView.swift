//
//  AnalyzingView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//

import SwiftUI


struct AnalyzingView: View {
    @State var session: Session
    // Checks if analyzing is complete. Experience will provide haptic feedback when complete
    @State private var isComplete: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                LoadingView()
                TypingTextView(text: "Analyzing Audio...", speed: .milliseconds(150))
            }
            .sensoryFeedback(.success, trigger: session.uploadStatus == .completed)
        }
    }

}

#Preview {
    AnalyzingView(session: Session())
}
