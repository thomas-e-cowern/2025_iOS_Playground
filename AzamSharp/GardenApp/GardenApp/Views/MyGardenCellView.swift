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
        }
    }
}

#Preview("Light Mode") {
    MyGardenCellView(myGardenVegetable: MyGardenVegetable.sampleVegetables[1])
}
