//
//  ValidationSummaryVIew.swift
//  FakeStoreProject
//
//  Created by Thomas Cowern on 7/23/25.
//

import SwiftUI

struct ValidationSummaryVIew: View {
    
    let errors: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(errors, id: \.self) { error in
                HStack(alignment: .top) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundStyle(.red)
                    
                    Text(error)
                        .foregroundStyle(.red)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                
            }
        }
        .padding()
        .background(Color.red.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ValidationSummaryVIew(errors: [
        "name cannot be empty",
        "password must be at least 8 characters",
        "Email format is invalid"
    ])
    .padding()
}
