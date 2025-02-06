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
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }  // MARK: End of list
            .navigationTitle("Wishes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
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

