//
//  LoadingView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/23/26.
//

import SwiftUI
import Combine

struct LoadingView: View {
    @State private var angle = 0.0
    @State private var isPulsing: Bool = false
    
    private let radius = 20.0
    private let timer = Timer.publish(every: 2.0 / 60.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Node()
                .foregroundStyle(Color.cyan)
                .blur(radius: 2.0)
                .offset(orbitOffset(startingAngle: 0))
                .scaleEffect(isPulsing ? 1.0 : 1.1)
                
            Node()
                .foregroundStyle(Color.purple)
                .blur(radius: 2.0)
                .offset(orbitOffset(startingAngle: Double.pi * 2 / 3))
                .scaleEffect(isPulsing ? 1.0 : 1.2)
            Node()
                .foregroundStyle(Color.black)
                .blur(radius: 2.0)
                .offset(orbitOffset(startingAngle: Double.pi * 4 / 3))
                .scaleEffect(isPulsing ? 1.0 : 1.2)
        }
        .onReceive(timer) { _ in
            angle += 0.04
            isPulsing = true
        }
        .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: isPulsing)
    }

    private func orbitOffset(startingAngle: Double) -> CGSize {
        let currentAngle = angle + startingAngle
        return CGSize(
            width: cos(currentAngle) * radius * sin(radius) * 2,
            height: sin(currentAngle) * radius
        )
    }
}

#Preview {
    LoadingView()
}
