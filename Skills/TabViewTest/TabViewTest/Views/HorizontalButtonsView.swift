//
//  HorizontalButtonsView.swift
//  TabViewTest
//
//  Created by Thomas Cowern on 5/21/25.
//

import SwiftUI

struct HorizontalButtonsView: View {
    
    let label: String
    let hasStroke: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .fontWeight(.semibold)
                .foregroundStyle(hasStroke ? .primary : Color(.systemBackground))
                .padding(.vertical, 4)
                .padding(.horizontal)
        }
        .background(
            ZStack {
                Capsule()
                    .foregroundStyle(hasStroke ? .clear : .primary)
                
                if  hasStroke {
                    Capsule()
                        .stroke(.primary, lineWidth: 2)
                }
            }
        )
    }
}

#Preview("Has stroke") {
    HorizontalButtonsView(label: "Test label", hasStroke: true, action: {})
}

#Preview("No stroke") {
    HorizontalButtonsView(label: "Test label", hasStroke: false, action: {})
}
