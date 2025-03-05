//
//  NoteListView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/24/25.
//

import SwiftUI

struct NoteListView: View {
    
    let myGardenVegetable: MyGardenVegetable
    @State private var addNotePresented: Bool = false
    
    var body: some View {
        VStack {
            if myGardenVegetable.notes != nil {
                List(myGardenVegetable.notes ?? []) { note in
                    HStack {
                        if let photoData = note.photo, let uiImage = UIImage(data: photoData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                        }
                        Text(note.title)
                    }
                }
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
