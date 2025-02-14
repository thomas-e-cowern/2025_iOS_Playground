//
//  VegetableListViewModel.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/14/25.
//

import SwiftUI

class VegetableListViewModel: ObservableObject {
    
    //    var httpService = HTTPService()
    @Published var vegetables = [Vegetable]()
    @Published var error: Error?
    
    init() {
        loadData()
    }
    
}

extension VegetableListViewModel {
    
    @MainActor
    func fetchVegetables() async throws {
        
        let BASE_URL = "https://azamsharp.com/vegetables.json"
        
        do {
            guard let url = URL(string: BASE_URL) else {
                print("Bad Url")
                throw VegetableError.invalidUrl
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("Bad Response")
                throw VegetableError.serverError
            }
            
            guard let vegetables = try? JSONDecoder().decode([Vegetable].self, from: data) else {
                print("Decoding Error")
                throw VegetableError.invalidData
            }
            
            self.vegetables = vegetables
        } catch {
            print("Unknown")
            self.error = error
        }
    }
    
    func loadData() {
        Task {
            print("loading data")
            try await fetchVegetables()
        }
    }
}
