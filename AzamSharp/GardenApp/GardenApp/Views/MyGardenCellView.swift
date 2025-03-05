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
                    Image(systemName: myGardenVegetable.notes?.count == 0 ? "" : "list.clipboard")
                    // remove comment lines to show number of notes...
//                    Text("\(myGardenVegetable.notes?.count ?? 0)")
                }
                .foregroundStyle(Color.green)
            }
            
            Spacer()
            
            // HarvestCountdownView
            HarvestCountdownView(plantingDate: myGardenVegetable.datePlanted, harvestDays: myGardenVegetable.daysToHarvest)
                .frame(width: 120, height: 120)
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
