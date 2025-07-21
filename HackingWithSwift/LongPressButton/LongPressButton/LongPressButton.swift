//
//  LongPressButton.swift
//  LongPressButton
//
//  Created by Thomas Cowern on 7/21/25.
//

import SwiftUI

struct LongPressButton: View {
    
    @GestureState private var pressed = false
    
    let image: Image
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .primary
    var strokeColor: Color = .red
    var strokeWidth: CGFloat = 6
    var action: () -> Void
    
    var body: some View {
        Image(systemName: "star")
            .font(.title)
            .foregroundColor(foregroundColor)
            .accessibility(addTraits: .isButton)
            .accessibility(removeTraits: .isImage)
            .padding()
            .background(
                Circle()
                    .fill(backgroundColor)
            )
            .overlay(
                Circle()
                    .trim(from: 0, to: pressed ? 1 : 0)
                    .rotation(.init(degrees: -90))
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                
            )
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($pressed) { new, existing, transaction in
                        existing = new
                    }
                    .onEnded { _ in
                        action()
                    }
            )
            .animation(.linear, value: pressed)
    }
}

#Preview {
    LongPressButton(image: Image(systemName: "star"), action: {})
}
