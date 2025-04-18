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
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    NavigationLink(value: wish) {
                        Text(wish.title)
                            .font(.title.weight(.light))
                            .padding(.vertical, 2)
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    modelContext.delete(wish)
                                }
                            }
                    }
                }
            }  // MARK: End of list
            .navigationTitle("Wishes")
            .navigationDestination(for: Wish.self, destination: { wish in
                EditWishView(wish: wish)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if !wishes.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
            }
            .alert("Ceate a new wish", isPresented: $isAlertShowing, actions: {
                TextField("Enter a wish", text: $title)
                
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Add")
                }
            })
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle",
                                           description: Text("No wishes yet.  Add one to your wishlist"))
                }
            }
        }
    }
}

// MARK: - Preview
#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}

#Preview("List with data") {
    
    // MARK: - this is local data
    //    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    //
    //    container.mainContext.insert(Wish(title: "Master SwiftData"))
    //    container.mainContext.insert(Wish(title: "Key West"))
    //    container.mainContext.insert(Wish(title: "Learn French"))
    //
    //    return ContentView()
    //        .modelContainer(container)
    
    // MARK: - This is extended data
    let preview = Preview()
    preview.addExamples(Wish.sampleWishes)
    return ContentView()
        .modelContainer(preview.modelContainer)
}

