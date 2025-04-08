//
//  PestCellView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 4/8/25.
//

import SwiftUI

struct PestCellView: View {
    
    let pest: Pest
    
    var body: some View {
           HStack(alignment: .center, spacing: 16) {
               // Vegetable Thumbnail Image
               AsyncImage(url: pest.photo) { image in
                   ZStack {
                       // Gradient Background
                       Circle()
                           .fill(
                               LinearGradient(
                                   gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.3)]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                               )
                           )
                           .frame(width: 85, height: 85) // Slightly larger than the image
                           .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
                       
                       // Image
                       image
                           .resizable()
                           .scaledToFill()
                           .frame(width: 75, height: 75)
                           .clipShape(Circle())
                           .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                   }
               } placeholder: {
                   ZStack {
                       // Gradient Placeholder Background
                       Circle()
                           .fill(
                               RadialGradient(
                                   gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]),
                                   center: .center,
                                   startRadius: 10,
                                   endRadius: 40
                               )
                           )
                           .frame(width: 85, height: 85)
                           .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
                       
                       ProgressView()
                           .scaleEffect(1.2)
                           .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                   }
               }
               
               // Vegetable Details
               VStack(alignment: .leading, spacing: 4) {
                   Text(pest.name)
                       .font(.headline)
                       .foregroundColor(.primary)
                   
                   Text(pest.body)
                       .font(.subheadline)
                       .foregroundColor(.secondary)
                       .lineLimit(2) // Limit to 2 lines for cleaner appearance
               }
           }
       }
}

#Preview {
    PestCellView(pest: PreviewData.loadPreviewVegetables()[0].pests![0])
}
