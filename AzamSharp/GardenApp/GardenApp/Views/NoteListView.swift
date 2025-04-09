//
//  NoteListView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/24/25.
//

import SwiftUI

struct NoteListView: View {
    
    @Environment(\.modelContext) private var context
    
    let myGardenVegetable: MyGardenVegetable
    @State private var addNotePresented: Bool = false
    @State private var searchText: String = ""
    
    private var filteredNotes: [Note] {
        if searchText.isEmpty {
            return myGardenVegetable.notes ?? []
        } else {
            return myGardenVegetable.notes?.filter {
                    $0.title.localizedCaseInsensitiveContains(searchText)
            } ?? []
        }
    }
    
    var body: some View {
        VStack {
            if myGardenVegetable.notes != nil {
                List {
                    ForEach(filteredNotes) { note in
                        NoteCellView(note: note, placeholderImage: myGardenVegetable.vegetable.imageUrl)
                    }
                    .onDelete(perform: deleteMyNote)
                }
                .searchable(text: $searchText)
            } else {
                Text("You have no notes yet.  Let's add some...")
            }
        } //: End of VStack
        .navigationTitle(myGardenVegetable.vegetable.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Note") {
                    addNotePresented = true
                }
            }
        }
        .sheet(isPresented: $addNotePresented) {
            NavigationStack {
                AddNoteView(myGardenVegetable: myGardenVegetable)
            }
        }
    }
    
    // MARK: - Methods and functions
    
    private func deleteMyNote(at offsets: IndexSet) {
        offsets.forEach { index in
            let noteToDelete = myGardenVegetable.notes![index]
            context.delete(noteToDelete)
            try? context.save()
        }
    }
}

#Preview("Light Mode") {
    NavigationStack {
        NoteListView(myGardenVegetable: MyGardenVegetable.sampleVegetables[1])
            .preferredColorScheme(.light)
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        NoteListView(myGardenVegetable: MyGardenVegetable.sampleVegetables[1])
            .preferredColorScheme(.dark)
    }
}
