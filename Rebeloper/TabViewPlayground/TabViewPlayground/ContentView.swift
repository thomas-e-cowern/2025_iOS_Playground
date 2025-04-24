//
//  ContentView.swift
//  TabViewPlayground
//
//  Created by Thomas Cowern on 4/24/25.
//

import SwiftUI

enum Tabs {
    case archery
    case badminton
    case baseball
}

struct ContentView: View {
    
//    @State private var selectedTabIndex: Tabs = .baseball
    @Environment(AppController.self) private var appController
    
    init() {
            UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.primary)
            UIPageControl.appearance().pageIndicatorTintColor = UIColor(.secondary)
    }
    
    var body: some View {
        
        @Bindable var appController = appController
        
        TabView(selection: $appController.selectedTabIndex) {
            Tab("Archery", systemImage: "figure.archery", value: Tabs.archery) {
                ArcheryView()
            }
//            .badge(10)
            .badge("")

            
            Tab("Badminton", systemImage: "figure.badminton", value: Tabs.badminton) {
                BadmintonView()
            }

            
            Tab("Baseball", systemImage: "figure.baseball", value: Tabs.baseball) {
                BaseballView()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    ContentView()
        .environment(AppController())
}
