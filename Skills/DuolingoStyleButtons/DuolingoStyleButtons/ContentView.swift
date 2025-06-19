//
//  ContentView.swift
//  DuolingoStyleButtons
//
//  Created by Thomas Cowern on 6/19/25.
//

import SwiftUI

struct ContentView: View {
    
    private let offsets: [CGFloat] = [0, -40, -60, -40, 0]
    private let icons: [String] = [
        "star.fill",
        "dumbbell.fill",
        "forward.fill",
        "star.fill",
        "bubbles.and.sparkles.fill"
    ]
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Section 1: Beginner")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.gray)
                
                ellipseButton(image: icons[0])
                    .buttonStyle(DepthButtonStyle(foregroundColor: .red, backgroundColor: .green))
                
                rectangleButton()
                    .buttonStyle(DepthButtonStyle(foregroundColor: .red, backgroundColor: .green, cornerRadius: 10))
            }
        }
    }
    
    @ViewBuilder
    private func ellipseButton(image: String) -> some View {
        Button {
            // More to come...
        } label: {
            Image(systemName: image)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 80, height: 70)
        .padding()
    }
    
    @ViewBuilder
    private func rectangleButton() -> some View {
        Button {
            // More to come...
        } label: {
            Text("Continue")
                .fontWeight(.semibold)
                .foregroundStyle(Color.background)
        }
        .frame(width: 250, height: 50)
    }
}

#Preview {
    ContentView()
}
