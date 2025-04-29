//
//  ContentView.swift
//  PhotopickerEditing
//
//  Created by Thomas Cowern on 4/29/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker: Bool = false
    
    var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .scaledToFit()
            }
            
            Button {
                isShowingImagePicker.toggle()
            } label: {
                Text("Pick Image")
            }
            .sheet(isPresented: $isShowingImagePicker) {
                UIImagePicker(selectedImage: $selectedImage)
                    .ignoresSafeArea()
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
