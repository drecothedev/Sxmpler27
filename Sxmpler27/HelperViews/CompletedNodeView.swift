//
//  CompletedNodeView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/23/26.
//

import SwiftUI

struct CompletedNodeView: View {
    @State private var isPulsing: Bool = false
    @State private var startDate = Date()
    
    private let radius = 50.0
    private let beatsPerOrbit = 4.0
    
    var bpm: Double

    var body: some View {
        TimelineView(.animation) { timeline in
            let elapsedTime = timeline.date.timeIntervalSince(startDate)
            let angle = elapsedTime * rotationsPerSecond * Double.pi * 2

            ZStack {
                Node()
                    .foregroundStyle(Color.cyan)
                    .blur(radius: 2.0)
                    .offset(orbitOffset(startingAngle: 0, angle: angle))
                    .scaleEffect(isPulsing ? 1.0 : 1.1)

                Node()
                    .foregroundStyle(Color.purple)
                    .blur(radius: 2.0)
                    .offset(orbitOffset(startingAngle: Double.pi * 2 / 3, angle: angle))
                    .scaleEffect(isPulsing ? 1.0 : 1.2)
                Node()
                    .foregroundStyle(Color.black)
                    .blur(radius: 2.0)
                    .offset(orbitOffset(startingAngle: Double.pi * 4 / 3, angle: angle))
                    .scaleEffect(isPulsing ? 1.0 : 1.2)
            }
        }
        .onAppear {
            startDate = Date()
            isPulsing = true
        }
        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isPulsing)
    }

    private var rotationsPerSecond: Double {
        max(bpm, 1.0) / 60.0 / beatsPerOrbit
    }

    private func orbitOffset(startingAngle: Double, angle: Double) -> CGSize {
        let currentAngle = angle + startingAngle
        return CGSize(
            width: cos(currentAngle) * radius,
            height: sin(currentAngle) * radius
        )
    }
}

#Preview {
    CompletedNodeView(bpm: 120)
}
