//
//  CustomSheetView.swift
//  ActionSheetPlayground
//
//  Created by Thomas Cowern on 12/4/25.
//

import SwiftUI

struct CustomSheetView: View {
    
    var title: String
    var message: String
    
    var body: some View {
        VStack {
            Text(title)
                .padding(.bottom, 2)
                .font(.headline)
                .fontWeight(.bold)
            Text(message)
                .padding(.bottom, 8)
                .font(.caption)
            
            DeleteButton(clicked: {
                print("Deleted...")
            })

            CustomButton(text: "Share", icon: "square.and.arrow.up", fontColor: .green, backgroundColor: .green.opacity(0.4)) {
                print("Shared....")
            }
        }
        .padding()
    }
}

#Preview {
    CustomSheetView(title: "This is the title", message: "This is the custom modifier message")
}
