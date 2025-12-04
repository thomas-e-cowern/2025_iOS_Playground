//
//  DeleteButton.swift
//  ActionSheetPlayground
//
//  Created by Thomas Cowern on 12/4/25.
//

import SwiftUI

struct DeleteButton: View {
//    var text: String
//    var icon: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            HStack {
                Text("Delete")
                
                Image(systemName: "trash")
            }
            .foregroundColor(Color.red)
            .padding()
            .background(Color.red.opacity(0.2))
            .cornerRadius(16)
        }
    }
}

#Preview {
    DeleteButton(clicked: {
        print("Deleted...")
    })
}
