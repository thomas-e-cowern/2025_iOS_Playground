//
//  ContentView.swift
//  ContextMenuPlayground
//
//  Created by Thomas Cowern on 12/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var color: Color = .purple
    
    var body: some View {
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
                print("You clicked the heart")
            } label: {
                HStack {
                    Text("Heart me!")
                    Image(systemName: "heart")
                }
            }


        })
//        .contextMenu {
//            Text("This should be the context menu")
//        }
    }
}

#Preview {
    ContentView()
}
