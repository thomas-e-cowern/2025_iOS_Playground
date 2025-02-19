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
                Text("Option view goes here....")
            }
        }
    }
}

#Preview {
    SeedSeedlingView(onSelected: { _ in })
}
