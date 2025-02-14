//
//  VegetableDetailScreen.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/14/25.
//

import SwiftUI

struct VegetableDetailScreen: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        VStack(spacing: 16) {
            ScrollView {
                AsyncImage(url: vegetable.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 10)
                } placeholder: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 200)
                        .overlay {
                            ProgressView()
                                .scaleEffect(1.5)
                                .progressViewStyle(CircularProgressViewStyle())
                                .tint(.gray)
                        }
                } // MARK: - End of AsyncImage
                .frame(maxWidth: .infinity, maxHeight: 300)
                .padding(.bottom, 8)
                
                Text(vegetable.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(vegetable.body)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    VegetableDetailScreen(vegetable: PreviewData.loadPreviewVegetables()[9])
}
