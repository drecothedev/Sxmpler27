//
//  SelectedView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//
import AVFoundation
import SwiftUI


struct SelectedView: View {
    @State var session: Session
    var body: some View {
        VStack {
            if session.uploadStatus == .selected {
                if let ass = session.asset {
                    ZStack {
                        Text(ass.url.lastPathComponent)
                            .lineLimit(1)
                            .truncationMode(.middle)
                            .minimumScaleFactor(0.8)
                            .padding(.horizontal, 16)
                            .frame(width: 200, height: 55)
                            .background(Material.ultraThinMaterial, in: Capsule())
                            .overlay {
                                Capsule().stroke()
                            }
                    }
                }
            }
            Button {
                Task {
                    do {
                        _ = try await session.getResults()
                        
                    } catch {
                        print("Error analyzing session. Check report.", error)
                    }
                }
            } label: {
                    AnalyzeButtonView()
                }
            }
    }
}

#Preview {
    SelectedView(session: Session())
}
