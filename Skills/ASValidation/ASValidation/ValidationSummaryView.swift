//
//  ValidationSummaryView.swift
//  ASValidation
//
//  Created by Thomas Cowern on 1/22/25.
//

import SwiftUI

struct ValidationSummaryView: View {
    
    let validationErrors: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) { // Organize errors vertically
            ForEach(validationErrors, id: \.self) { error in
                Text(error)
                    .font(.body) // Set a readable font size
                    .foregroundColor(.red) // Highlight errors in red
                    .padding(.vertical, 4) // Add vertical padding
                    .background(Color(.systemGray6)) // Add a light background for contrast
                    .cornerRadius(8) // Round the corners of the background
            }
        }
        .padding() // Add padding around the VStack
    }
}

#Preview {
    ValidationSummaryView(validationErrors: ["Username is required", "Password is required"])
}
