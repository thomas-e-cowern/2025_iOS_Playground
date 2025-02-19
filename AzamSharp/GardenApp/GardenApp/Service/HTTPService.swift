//
//  HTTPService.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/13/25.
//

import SwiftUI

class HTTPService: ObservableObject {
    
    @Published var error: Error?
    let BASE_URL = "https://azamsharp.com/vegetables"
    
    @MainActor
    func fetchVegatables() async throws -> [Vegetable] {
        do {
            guard let url = URL(string: BASE_URL) else {
                throw VegetableError.invalidUrl
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw VegetableError.serverError
            }
            
            guard let decodedVegetables = try? JSONDecoder().decode([Vegetable].self, from: data) else {
                throw VegetableError.invalidData
            }
            
            return decodedVegetables
            
        } catch {
            print("Caught error: \(error)")
            self.error = error
            throw VegetableError.invalidUrl
        }
    }
}
