//
//  ContentView.swift
//  PhotosCamera
//
//  Created by Thomas Cowern on 2/28/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var photoPickerItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var isShowingCamera: Bool = false
    
    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            } else {
#if DEBUG
                Image("camera")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
#endif
            }
            
            PhotosPicker(selection: $photoPickerItem, matching: .images, photoLibrary: .shared())
            {
                Text("Select an image")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .onChange(of: photoPickerItem) { _, newItem in
                if let newItem = newItem{
                    Task{
                        if let data = try? await newItem.loadTransferable(type: Data.self),
                           let image = UIImage(data: data){
                            selectedImage = image
                        }
                    }
                }
            }
            
            Button {
                isShowingCamera.toggle()
            } label: {
                Image(systemName: "camera.fill")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .sheet(isPresented: $isShowingCamera) {
                CameraView(image: $selectedImage)
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
