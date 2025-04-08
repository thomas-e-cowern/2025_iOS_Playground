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
    @Published var pests = [Pest]()
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
                throw VegetableError.invalidUrl
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw VegetableError.serverError
            }
            
            guard let vegetables = try? JSONDecoder().decode([Vegetable].self, from: data) else {
                throw VegetableError.invalidData
            }
            
            self.vegetables = vegetables
            getPests()
        } catch {
            self.error = error
            throw VegetableError.invalidUrl
        }
    }
    
    func loadData() {
        Task {
            try await fetchVegetables()
        }
    }
    
    func getPests() {
        let allPests = vegetables.flatMap {
            $0.pests ?? []
        }
        
        pests = Set(allPests.map {
            $0.name.lowercased()
        }).compactMap { name in
            allPests.first { $0.name.lowercased() == name }
        }
    }
}
