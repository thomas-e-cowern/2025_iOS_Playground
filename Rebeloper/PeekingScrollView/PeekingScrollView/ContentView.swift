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
        ScrollView {
            PeekingScrollView(images, contentMargins: 20) { index, image in
                MyCell(index: index, imageName: image)
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
