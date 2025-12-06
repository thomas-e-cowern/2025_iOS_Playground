//
//  ContentView.swift
//  ContextMenuPlayground
//
//  Created by Thomas Cowern on 12/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var color: Color = .purple
    @State var heartColor: Color = .red
    @State var heartSize: CGFloat = 80
    @State private var imageScale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            
            VStack {
                Image(systemName: "globe")
                    .font(.title)
                Text("Hello, world!")
                    .font(.headline)
                Text("Using the context menu")
                    .font(.subheadline)
            }
            .padding()
            .background(color)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .contextMenu(menuItems: {
                Button {
                    print("You clicked try me...")
                    withAnimation(.spring()) { // Use a spring animation for a bouncy effect
                        imageScale = (imageScale == 1.0) ? 1.5 : 1.0 // Toggle between normal and larger size
                    }
                    //                    if heartSize == 80 {
                    //                        heartSize = 160
                    //                    } else {
                    //                        heartSize = 80
                    //                    }
                } label: {
                    Label("Try me...", systemImage: "flame.fill")
                }
                
                Button {
                    print("You changed the color")
                    if color == .purple {
                        color = .red
                    } else {
                        color = .purple
                    }
                } label: {
                    Text("Button 2")
                }
                
                Button {
                    if heartColor == .red {
                        heartColor = .orange
                    } else {
                        heartColor = .red
                    }
                    print("You clicked the heart")
                } label: {
                    HStack {
                        Text("Heart me!")
                        Image(systemName: "heart")
                    }
                }
                
                
            }) // MARK: End of contextMenu
            
            Spacer()
                .frame(height: 250)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(heartColor)
                .font(.system(size: heartSize))
                .padding()
                .scaleEffect(imageScale)
        } // MARK: End of VStack
    }
}

#Preview {
    ContentView()
}
