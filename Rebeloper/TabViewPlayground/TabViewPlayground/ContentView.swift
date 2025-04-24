//
//  ContentView.swift
//  TabViewPlayground
//
//  Created by Thomas Cowern on 4/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView {
            Tab("Archery", systemImage: "figure.archery") {
                ArcheryView()
            }
            
            Tab("Badminton", systemImage: "figure.badminton") {
                BadmintonView()
            }
            
            Tab("Baseball", systemImage: "figure.baseball") {
                BaseballView()
            }
        }
    }
}

#Preview {
    ContentView()
}
