//
//  MyGardenCellView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/21/25.
//

import SwiftUI

struct MyGardenCellView: View {
    
    let myGardenVegetable: MyGardenVegetable
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // Vegetable Thumbnail Image
            if let imageUrl = myGardenVegetable.vegetable.imageUrl {
                VegetableImageView(vegetableImageUrl: imageUrl)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(myGardenVegetable.vegetable.name)
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                HStack {
                    Image(systemName: myGardenVegetable.plantOption.icon)
                        .foregroundStyle(Color.green)
                }
            }
            
            Spacer()
            
            // HarvestCountdownView
        }
    }
}

#Preview("Light Mode") {
    MyGardenCellView(myGardenVegetable: MyGardenVegetable.sampleVegetables[1])
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    MyGardenCellView(myGardenVegetable: MyGardenVegetable.sampleVegetables[1])
        .preferredColorScheme(.dark)
}
