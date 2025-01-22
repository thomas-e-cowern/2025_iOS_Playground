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
        ForEach(validationErrors, id: \.self) { error in
            Text(error)
        }
    }
}

#Preview {
    ValidationSummaryView(validationErrors: ["Username is required", "Password is required"])
}
