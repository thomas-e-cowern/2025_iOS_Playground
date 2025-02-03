//
//  NavRoot.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

struct NavRoot: View {
    
    @State private var navigation = Navigation()
    
    var body: some View {
        NavigationStack(path: $navigation.stack) {
            MyView1()
                .navigationDestination(for: Destination.self) { destination in
                    destination
                }
            // can also be written as .navigationDestination(for: Destination.self) { $0 }
        }
        .environment(navigation)
    }
}

#Preview {
    
    @Previewable @Environment(Navigation.self) var navigation
    
    NavigationStack {
        NavRoot()
            .environment(navigation)
    }
}
