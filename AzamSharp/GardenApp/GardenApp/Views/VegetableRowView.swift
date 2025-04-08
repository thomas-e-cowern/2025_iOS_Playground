//
//  VegetableRowView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/14/25.
//

import SwiftUI

struct VegetableRowView: View {
    
    let vegetable: Vegetable
    
    var body: some View {
            HStack(alignment: .center, spacing: 16) {
                if let imageUrl = vegetable.imageUrl {
                    VegetableImageView(vegetableImageUrl: imageUrl)
                }
                
                // Vegetable Details
                VStack(alignment: .leading, spacing: 4) {
                    Text(vegetable.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(vegetable.body)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2) // Limit to 2 lines for cleaner appearance
                }
            }
        }
}


// Preview using Model sample data extension
#Preview("Extension Data") {
    VegetableRowView(vegetable: PreviewData.loadPreviewVegetables()[9])
}


#Preview("Preview Data") {
    VegetableRowView(vegetable: PreviewData.loadPreviewVegetables()[0])
}
