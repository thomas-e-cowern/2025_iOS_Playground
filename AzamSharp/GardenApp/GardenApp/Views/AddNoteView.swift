//
//  AddNoteView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/24/25.
//
import SwiftUI
import SwiftData
import PhotosUI

struct AddNoteView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let myGardenVegetable: MyGardenVegetable
    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""
    
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var uiImage: UIImage?
    @State private var imageData: Data?
    
    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(minHeight: 200)
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 20) {
                PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 60, height: 60)
                        Image(systemName: "photo.on.rectangle.angled.fill")
                            .font(.title)
                            .foregroundStyle(Color.blue)
                    }
                }
            }
            .buttonStyle(.borderless)
            
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .task(id: selectedPhoto) {
            if let selectedPhoto {
                do {
                    if let data = try await selectedPhoto.loadTransferable(type: Data.self) {
                        uiImage = UIImage(data: data)
                        imageData = data
                    }
                } catch {
                    print("There was a problem with selectedPhoto: \(error.localizedDescription)")
                    // MARK: TODO - Add error throwing here... photoErrors
                }
            }
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
        note.photo = imageData
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
