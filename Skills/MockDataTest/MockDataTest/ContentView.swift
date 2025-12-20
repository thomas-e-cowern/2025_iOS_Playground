//
//  ContentView.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dataService) private var dataService
    @State private var items: [Item] = []
    @State private var isLoading = false

    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    Text(item.name)
                }
            }
        }
        .task {
            isLoading = true
            items = try! await dataService.fetchItems()
            isLoading = false
        }
    }
}

#Preview {
    ContentView()
}
