//
//  UIImagePicker.swift
//  PhotopickerEditing
//
//  Created by Thomas Cowern on 4/29/25.
//

import SwiftUI

struct UIImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var selectedImage: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, selectedImage: $selectedImage)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to see here... this isn't used but is required for conformance
    }
    
    
    typealias UIViewControllerType = UIImagePickerController
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: UIImagePicker
        @Binding var selectedImage: UIImage?
        
        init(parent: UIImagePicker, selectedImage: Binding<UIImage?>) {
            self.parent = parent
            self._selectedImage = selectedImage
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                self.selectedImage = uiImage
                parent.dismiss()
            }
        }
    }

}
