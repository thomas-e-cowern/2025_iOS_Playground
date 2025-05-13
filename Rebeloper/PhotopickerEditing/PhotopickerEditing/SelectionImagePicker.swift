//
//  SelectionImagePicker.swift
//  PhotopickerEditing
//
//  Created by Thomas Cowern on 5/13/25.
//
import SwiftUI

struct SelectionImagePicker<Label: View>: View {
    
    @Binding var selectedImage: UIImage?
    @ViewBuilder var label: () -> Label
    @State private var isConfirmationDialogIsPresented: Bool = false
    @State private var selectedImageSourceType: ImageSourceType?
    
    var body: some View {
        Button {
            isConfirmationDialogIsPresented.toggle()
        } label: {
            label()
        }
        .buttonStyle(.plain)
        .confirmationDialog("Choose an Image  ", isPresented: $isConfirmationDialogIsPresented) {
            Button("Camera") {
                selectedImageSourceType = .camera
            }
            Button("Library") {
                selectedImageSourceType = .photoLibrary
            }
            Button("Cancel", role: .cancel) {
                // Cancels automatically
            }
        }
        .sheet(item: $selectedImageSourceType) { sourceType in
            UIImagePicker(selectedImage: $selectedImage, imageSourceType: sourceType)
                .ignoresSafeArea(.all)
        }
    }
}
