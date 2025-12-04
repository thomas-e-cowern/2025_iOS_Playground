//
//  CustomButton.swift
//  ActionSheetPlayground
//
//  Created by Thomas Cowern on 12/4/25.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var icon: String
    var fontColor: Color
    var backgroundColor: Color
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            HStack {
                Text(text)
                
                Image(systemName: icon)
            }
            .foregroundColor(fontColor)
            .padding()
            .background(backgroundColor.opacity(0.2))
            .cornerRadius(16)
        }
    }
}

#Preview {
    CustomButton(text: "Custom Button", icon: "star", fontColor: .green, backgroundColor: .green, clicked: {
        print("Custom button has been clicked")
    })
}
