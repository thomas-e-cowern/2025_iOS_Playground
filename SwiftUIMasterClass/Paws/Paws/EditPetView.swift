//
//  EditPetView.swift
//  Paws
//
//  Created by Thomas Cowern on 2/10/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditPetView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var pet: Pet
    
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        Form {
            // MARK: - Image
            if let imageData = pet.photo {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
            } else {
                CustomContentUnavailableView(
                    icon: "pawprint.circle",
                    title: "No Photo",
                    description: "Add a photo of your favorite pet to make it easier to find them."
                )
                .padding(.top)
            }
            
            // MARK: - Photo Picker
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                Label("Select a photo", systemImage: "photo.badge.plus")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            
            // MARK: - TextField
            TextField("Name", text: $pet.name)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle.weight(.light))
                .padding(.vertical)
            
            // MARK: - Button
            Button {
                dismiss()
            } label: {
                Text("Save")
                    .font(.title3.weight(.medium))
                    .padding(0)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .listRowSeparator(.hidden)
            .padding(.bottom)

        }
        .listStyle(.plain)
        .navigationTitle("Edit \(pet.name)")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onChange(of: photosPickerItem) { oldValue, newValue in
            Task {
                pet.photo = try await photosPickerItem?.loadTransferable(type: Data.self)
            }
        }
    }
}

#Preview {
    NavigationStack {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Pet.self, configurations: configuration)
            let sampleData = Pet(name: "Daisy")
            
            return EditPetView(pet: sampleData)
                .modelContainer(container)
        } catch {
            fatalError("Could not load preview data. \(error.localizedDescription)")
        }
    }
}
