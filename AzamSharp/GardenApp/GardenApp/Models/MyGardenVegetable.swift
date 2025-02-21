//
//  MyGardenVegetable.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/20/25.
//

import Foundation
import SwiftData

@Model
class MyGardenVegetable {
    var vegetable: Vegetable
    var plantOption: PlantOption
    var datePlanted: Date = Date()
    
    init(vegetable: Vegetable, plantOption: PlantOption) {
        self.vegetable = vegetable
        self.plantOption = plantOption
    }
}

extension MyGardenVegetable {
    static var sampleVegetables: [MyGardenVegetable] {
        [
            MyGardenVegetable(vegetable: PreviewData.loadPreviewVegetables()[0], plantOption: .seed),
            MyGardenVegetable(vegetable: PreviewData.loadPreviewVegetables()[4], plantOption: .seedling),
            MyGardenVegetable(vegetable: PreviewData.loadPreviewVegetables()[8], plantOption: .seedling),
            MyGardenVegetable(vegetable: PreviewData.loadPreviewVegetables()[3], plantOption: .seed),
            MyGardenVegetable(vegetable: PreviewData.loadPreviewVegetables()[11], plantOption: .seedling)
        ]
    }
}
