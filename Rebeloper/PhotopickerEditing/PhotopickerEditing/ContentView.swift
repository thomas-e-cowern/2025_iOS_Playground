//
//  ContentView.swift
//  PhotopickerEditing
//
//  Created by Thomas Cowern on 4/29/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .scaledToFit()
            }
            SelectionImagePicker(selectedImage: $selectedImage) {
                Text("Pick an image")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
