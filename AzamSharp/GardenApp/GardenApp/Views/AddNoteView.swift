//
//  AddNoteView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/24/25.
//
import SwiftUI
import SwiftData

struct AddNoteView: View {
    
    @Environment(\.modelContext) private var context
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
                    saveNote()
                }
            }
        }
    }
    
    // MARK: - Methods and functions
    private func saveNote() {
        // MARK: TODO - Save a new note
        let note = Note(title: noteTitle, body: noteBody)
        myGardenVegetable.notes?.append(note)
        //        context.insert(note)
        dismiss()
    }
}

#Preview("Light Mode") {
    NavigationStack {
        AddNoteView(myGardenVegetable: MyGardenVegetable.sampleVegetables[2])
            .preferredColorScheme(.light)
            .modelContainer(previewContainer)
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        AddNoteView(myGardenVegetable: MyGardenVegetable.sampleVegetables[2])
            .preferredColorScheme(.dark)
            .modelContainer(previewContainer)
    }
}
