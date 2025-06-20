//
//  ActiveTabView.swift
//  HealthKitPlayground
//
//  Created by Thomas Cowern on 6/20/25.
//

import SwiftUI

struct ActiveTabView: View {
    
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house", value: "Home") {
                HomeView()
            }
        }
    }
}

#Preview {
    ActiveTabView()
}
