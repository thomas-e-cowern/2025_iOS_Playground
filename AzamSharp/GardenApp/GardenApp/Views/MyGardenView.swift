//
//  MyGardenView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/21/25.
//

import SwiftUI
import SwiftData

struct MyGardenView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var myGardenVegetabes: [MyGardenVegetable]
    
    var body: some View {
        List {
            ForEach(myGardenVegetabes) { myVeggy in
                NavigationLink {
                    NoteListView(myGardenVegetable: myVeggy)
                } label: {
                    MyGardenCellView(myGardenVegetable: myVeggy)
                }
            }
            .onDelete(perform: deleteMyGardenVegetable)
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
    
    // MARK: - Methods and functions
    private func deleteMyGardenVegetable(at offsets: IndexSet) {
        offsets.forEach { index in
            let myGardenVegetable = myGardenVegetabes[index]
            context.delete(myGardenVegetable)
            do {
                try context.save()
            } catch {
                print("Failed to delete item from myGardenVegetables: \(error)")
            }
        }
    }
}

#Preview("Light Mode") {
    NavigationStack {
        MyGardenView()
    }
    .modelContainer(previewContainer)
    .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    NavigationStack {
        MyGardenView()
    }
    .modelContainer(previewContainer)
    .preferredColorScheme(.dark)
}

