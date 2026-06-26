//
//  FailedView.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//

import SwiftUI

struct FailedView: View {
    @State var session: Session
    var body: some View {
        Text(":( uh, oh. We've hit an error.")
    }
}

#Preview {
    FailedView(session: Session())
}
