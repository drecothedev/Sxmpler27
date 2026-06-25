//
//  StartButtonView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//

import SwiftUI

struct StartButtonView: View {
    var body: some View {
        ZStack {
            HStack {
                Capsule()
                    .frame(width: 27, height: 55)
                    .foregroundStyle(.cyan.opacity(0.3))
                Capsule()
                    .frame(width: 27, height: 55)
                    .foregroundStyle(.purple.opacity(0.3))
                Capsule()
                    .frame(width: 17, height: 55)
                    .foregroundStyle(.white.opacity(0.3))
            }

            Capsule()
                .stroke()
                .frame(width: 150, height: 55)
                .foregroundStyle(
                    LinearGradient(colors: [.black.opacity(0.7), .white], startPoint: .leading, endPoint: .bottomTrailing)
                )
                .background(Material.ultraThinMaterial, in: Capsule())
            Text("Start")
                .bold()
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    StartButtonView()
}
