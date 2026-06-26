//
//  Node.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//

import SwiftUI

struct Node: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 20)
            Circle()
                .frame(width: 20)
                .foregroundStyle(Material.ultraThin)
        }
    }
}

#Preview {
    Node()
}
