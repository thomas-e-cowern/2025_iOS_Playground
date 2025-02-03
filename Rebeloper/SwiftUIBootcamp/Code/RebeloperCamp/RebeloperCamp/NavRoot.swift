//
//  NavRoot.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

struct NavRoot: View {
    
    @State private var navigation = Navigation()
    
//    @State var selectedTab: TabNavigation = .home
    
    var body: some View {
        NavigationStack {
            TabView(selection: $navigation.selectedTab) {
                Tab("View 1", systemImage: "person", value: .home) {
                    MyView1()
                }
                Tab("View 2", systemImage: "star", value: .profile) {
//                    MyView2(title: "From tabs...")
                    VStack {
                        Button("Switch to tab 3") {
                            navigation.selectedTab = .settings
                        }
                    }
                }
                Tab("View 3", systemImage: "house", value: .settings) {
                    MyView3()
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                destination
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
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
