//
//  ContentView.swift
//  WishList
//
//  Created by Thomas Cowern on 2/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                }
            }  // MARK: End of list
            .navigationTitle("Wishes")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", image: "heart.circle",
                                           description: Text("No wishes yet.  Add one to your wishlist"))
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
