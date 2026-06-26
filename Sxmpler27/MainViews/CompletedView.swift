//
//  CompletedView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//

import SwiftUI
import Combine

struct CompletedView: View {
    @State var session: Session
    @State private var showReset: Bool = false
    
    let timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        if let results = session.results {
            ZStack {
                CompletedNodeView(bpm: Double(results.bpm) ?? 120)
                VStack {
                    Text("Key: \(results.key)")
                    Text("BPM: \(results.bpm)")
                    if showReset {
                        Button {
                            session.resetSession()
                        } label: {
                            DefaultButtonView(text: "Reset")
                        }
                    }
                }
                .onReceive(timer) { _ in
                    withAnimation(.easeIn(duration: 1.0)) {
                        showReset = true
                    }
                }
            }
        }
    }
}

#Preview {
    CompletedView(session: Session())
}
