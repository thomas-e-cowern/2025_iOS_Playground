//
//  DeleteButton.swift
//  ActionSheetPlayground
//
//  Created by Thomas Cowern on 12/4/25.
//

import SwiftUI

struct DeleteButton: View {
    var text: String
        var icon: String
        var clicked: (() -> Void) /// use closure for callback
        
        var body: some View {
            Button(action: clicked) { /// call the closure here
                HStack {
                    Text(text) /// your text
                    
                    Image(systemName: icon) // your icon image
                }
                .foregroundColor(Color.red)
                .padding()
                .background(Color.red.opacity(0.2))
                .cornerRadius(16)
            }
        }
}

#Preview {
    DeleteButton(text: "Delete", icon: "trash", clicked: {
        print("Deleted...")
    })
}
