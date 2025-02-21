//
//  PreviewContainer.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/20/25.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {
    
    let container = try! ModelContainer(for: Vegetable.self, MyGardenVegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
}()
