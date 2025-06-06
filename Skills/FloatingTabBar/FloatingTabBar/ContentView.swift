//
//  ContentView.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/2/25.
//

import SwiftUI

enum AppTab: String, CaseIterable, FloatingTabProtocol {
    case memories = "Memories"
    case library = "Library"
    case albums = "Albums"
    case search = "Search"
    
    var symbolImage: String {
        switch self {
        case .memories:
            return "photo"
        case .library:
            return "book.closed"
        case .albums:
            return "square.stack.fill"
        case .search:
            return "magnifyingglass"
        }
    }
}

struct ContentView: View {
    
    @State private var activeTab: AppTab = .library
    
    var body: some View {
        FloatingTabView(selection: $activeTab) { tab, tabBarHeight in
            switch tab {
            case .memories:
                Text("Memories")
            case .library:
                LibraryView()
            case .albums:
                Text("Albums")
            case .search:
                Text("Search")
            }
        }
    }
}

#Preview {
    ContentView()
}
