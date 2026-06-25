//
//  SelectedView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//

import SwiftUI

struct SelectedView: View {
    @State var session: Session
    var body: some View {
        StartButtonView()
    }
}

#Preview {
    SelectedView(session: Session())
}
