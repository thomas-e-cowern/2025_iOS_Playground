//
//  SeedSeedlingView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/19/25.
//

import SwiftUI

enum PlantOption: Codable {
    case seed
    case seedling
    
    var title: String {
        switch self {
        case .seed:
            return "Seed"
        case .seedling:
            return "Seedling"
        }
    }
    
    var icon: String {
        switch self {
        case .seed:
            return "leaf.fill"
        case .seedling:
            return "sunrise.fill"
        }
    }
}

struct SeedSeedlingView: View {
    
    let onSelected: (PlantOption) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Choose an option")
                .font(.headline)
            
            HStack(spacing: 24) {
                OptionView(option: .seed) { option in
                    onSelected(option)
                    dismiss()
                }
                
                OptionView(option: .seedling) { option in
                    onSelected(option)
                    dismiss()
                }
            }
        } //: End of VStack
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
        .padding()
    }
}

#Preview {
    SeedSeedlingView(onSelected: { _ in })
}
