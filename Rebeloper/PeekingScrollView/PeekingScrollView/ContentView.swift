//
//  ContentView.swift
//  PeekingScrollView
//
//  Created by Thomas Cowern on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    
    let images: [String] = [
        "Cloudy-driveway",
        "Good-morning",
        "Palm-tree",
        "Rainbow",
        "Somber-sunrise"
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(images, id: \.self) { image in
                    MyCell(index: image.count, imageName: image.description)
//                    Image(image)
//                        .resizable()
//                        .scaledToFit()
//                        .padding()
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
