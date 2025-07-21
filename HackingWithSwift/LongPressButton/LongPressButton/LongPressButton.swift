//
//  LongPressButton.swift
//  LongPressButton
//
//  Created by Thomas Cowern on 7/21/25.
//

import SwiftUI

struct LongPressButton: View {
    
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .primary
    var strokeColor: Color = .red
    var strokeWidth: CGFloat = 6
    
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
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
            )
    }
}

#Preview {
    LongPressButton()
}
