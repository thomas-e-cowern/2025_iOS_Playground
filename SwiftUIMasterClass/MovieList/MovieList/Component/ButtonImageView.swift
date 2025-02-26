//
//  ButtonImageView.swift
//  MovieList
//
//  Created by Thomas Cowern on 2/26/25.
//

import SwiftUI

struct ButtonImageView: View {
    
    // MARK: - Properties
    let symbolName: String
    
    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue.gradient)
            .padding(8)
            .background(
                Circle()
                    .fill(.ultraThickMaterial)
            )
            .frame(width: 80)
    }
}

#Preview("Light Mode") {
    ButtonImageView(symbolName: "plus.circle.fill")
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ButtonImageView(symbolName: "plus.circle.fill")
        .preferredColorScheme(.dark)
}
