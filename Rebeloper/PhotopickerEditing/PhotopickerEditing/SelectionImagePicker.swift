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
    
    var body: some View {
        Text("SelectionImagePicker")
    }
}

#Preview {
    SelectionImagePicker()
}
