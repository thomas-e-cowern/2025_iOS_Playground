//
//  EditWishView.swift
//  WishList
//
//  Created by Thomas Cowern on 2/6/25.
//

import SwiftUI

struct EditWishView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var wish: Wish
    
    // MARK: - Body
    var body: some View {
        VStack {
            Form {
                TextField("Wish", text: $wish.title)
                Button("Save") {
                    dismiss()
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        } //: End of VStack
        .navigationTitle("Edit Wish")
    }
}

// MARK: - Preview
#Preview {
    EditWishView(wish: Wish(title: "Go to Vegas"))
}
