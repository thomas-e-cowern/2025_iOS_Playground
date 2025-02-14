//
//  PreviewData.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/14/25.
//

import Foundation

struct PreviewData {
    static func loadPreviewVegetables() -> [Vegetable] {
        guard let url = Bundle.main.url(forResource: "Vegetables", withExtension: "json") else {
            print("DEBUG: - error get url from Bundle.main")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let vegetables = try JSONDecoder().decode([Vegetable].self, from: data)
            return vegetables
        } catch {
            print("DEBUG: - error loading JSON file")
            return []
        }
    }
}
