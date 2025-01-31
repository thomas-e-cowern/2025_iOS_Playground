//
//  NavRoot.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

struct NavRoot: View {
    var body: some View {
        NavigationStack {
            MyView1()
        }
    }
}

#Preview {
    NavigationStack {
        NavRoot()
    }
}
