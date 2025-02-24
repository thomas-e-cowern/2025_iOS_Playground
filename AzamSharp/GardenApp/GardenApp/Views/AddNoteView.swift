//
//  AddNoteView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/24/25.
//
import SwiftUI
import SwiftData

struct AddNoteView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let myGardenVegetable: MyGardenVegetable
    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(minHeight: 200)
                .multilineTextAlignment(.leading)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    // MARK: TODO - Save the note
                }
            }
        }
    }
}

#Preview("Light Mode") {
    NavigationStack {
        AddNoteView(myGardenVegetable: MyGardenVegetable.sampleVegetables[2])
            .preferredColorScheme(.light)
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        AddNoteView(myGardenVegetable: MyGardenVegetable.sampleVegetables[2])
            .preferredColorScheme(.dark)
    }
}
