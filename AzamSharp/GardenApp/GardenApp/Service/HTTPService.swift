//
//  HTTPService.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/13/25.
//

import SwiftUI

@Observable
class HTTPService {
    
    let BASE_URL = "https://azamsharp.com/vegetables.json"
    
    func fetchVegatables() async throws -> [Vegetable] {
        
        guard let url = URL(string: BASE_URL) else {
            print("DEBUG: Bad URL")
            return []
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("DEBUG: Error in response")
            return []
        }
        
        guard let decodedVegetables = try? JSONDecoder().decode([Vegetable].self, from: data) else {
            print ("DEBUG: Could not decode JSON")
            return []
        }
        
        return decodedVegetables
    }
}
