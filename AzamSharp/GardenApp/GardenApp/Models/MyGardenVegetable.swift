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
