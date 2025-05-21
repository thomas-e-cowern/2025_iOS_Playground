//
//  BookInfoButtonsView.swift
//  TabViewTest
//
//  Created by Thomas Cowern on 5/21/25.
//

import SwiftUI

struct BookInfoButtonsView: View {
    var body: some View {
        HStack {
            Button {
                // More to come...
            } label: {
                Image(systemName: "bookmark")
            }
            .font(.title2)
            
            HorizontalButtonsView(label: "Sample", hasStroke: true) {
                // More to come...
            }
            
            HorizontalButtonsView(label: "View", hasStroke: false) {
                // More to come...
            }

        }
        .foregroundStyle(.primary)
        .padding(.vertical)
    }
}

#Preview {
    BookInfoButtonsView()
}
