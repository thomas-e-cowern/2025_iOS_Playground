//
//  OptionView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/19/25.
//

import SwiftUI

struct OptionView: View {
    
    let option: PlantOption
    let action: (PlantOption) -> Void
    
    var body: some View {
        Button {
            action(option)
        } label: {
            HStack(spacing: 8) {
                Image(systemName: option.icon)
                    .foregroundStyle(Color.green)
                Text(option.title)
                    .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }

    }
}

#Preview("Seed Option") {
    OptionView(option: PlantOption.seed, action: { _ in })
}

#Preview("Seedling Option") {
    OptionView(option: PlantOption.seedling, action: { _ in })
}
