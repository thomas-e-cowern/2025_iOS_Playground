//
//  VegetableDetailScreen.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/14/25.
//

import SwiftUI
import SwiftData

struct VegetableDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    
    let vegetable: Vegetable

    @State private var showSeedOrSeedlingMenu: Bool = false
    
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
        .navigationTitle(vegetable.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showSeedOrSeedlingMenu = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(Color.green)
                }

            }
        }
        .sheet(isPresented: $showSeedOrSeedlingMenu) {
            SeedSeedlingView(onSelected: { option in
                print(option.title)
                saveVegetableToMyGarden(with: option)
            })
            .presentationDetents([.fraction(0.25)])
            .presentationBackground(Color(.systemGray6))
        }
    }
    
    // MARK: - Methods and functions
    private func saveVegetableToMyGarden(with plantOption: PlantOption) {
        let myGardenVegatable = MyGardenVegetable(vegetable: vegetable, plantOption: plantOption)
        context.insert(myGardenVegatable)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
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
    NavigationStack {
        VegetableDetailScreen(vegetable: PreviewData.loadPreviewVegetables()[9])
    }
    .modelContainer(previewContainer)
}
