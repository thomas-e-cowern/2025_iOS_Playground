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
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Quick Facts")
                        .font(.title2.weight(.bold))
                    
                    VegetableDetailRow(icon: "leaf", title: "Seed Depth", value: vegetable.seedDepth)
                    VegetableDetailRow(icon: "thermometer", title: "Germination Temp", value: vegetable.germinationSoilTemp)
                    VegetableDetailRow(icon: "calendar", title: "Days to Germination", value: "\(vegetable.daysToGermination) days")
                    VegetableDetailRow(icon: "sun.max", title: "Light Requirement", value: vegetable.light)
                    VegetableDetailRow(icon: "drop", title: "Watering", value: vegetable.watering)
                    VegetableDetailRow(icon: "leaf.arrow.triangle.circlepath", title: "Companions", value: vegetable.goodCompanions)
                    VegetableDetailRow(icon: "exclamationmark.triangle", title: "Bad Companions", value: vegetable.badCompanions)
                    VegetableDetailRow(icon: "heart.fill", title: "Health Benefits", value: vegetable.healthBenefits.isEmpty ? "N/A" : vegetable.healthBenefits)
                }
                .padding()
                
                Divider()
                
                SectionHeader(title: "Growing Tips")
                Text(vegetable.growingDescription)
                    .font(.body)
                    .foregroundStyle(.secondary)
                
                SectionHeader(title: "harvesting Tips")
                Text(vegetable.harvestDescription)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .scrollIndicators(.hidden)
            .padding()
        }
    }
}

struct SectionHeader: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.primary)
            .padding(.top)
            .padding(.bottom)
    }
}

#Preview {
    VegetableDetailScreen(vegetable: PreviewData.loadPreviewVegetables()[9])
}
