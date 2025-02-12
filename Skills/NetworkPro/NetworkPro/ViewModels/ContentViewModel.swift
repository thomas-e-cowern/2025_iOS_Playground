//
//  ContentViewModel.swift
//  NetworkPro
//
//  Created by Thomas Cowern on 2/12/25.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var coins = [Coin]()
    
    let BASE_URL = "https://api.coingecko.com/api/v3/coins/"
    
    var urlString: String {
        return  "\(BASE_URL)markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&price_change_percentage=24h"
    }
    
    init() {
//        fetchCoinsWithURLSession()
        loadData()
    }
}
// MARK: - Async Await
extension ContentViewModel {
    
    @MainActor
    func fetchCoinsAsync() async throws {
        guard let url = URL(string: urlString) else {
            print("DEBUG: Invalid URL")
            return
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print( "DEBUG: Response error \((response as? HTTPURLResponse)?.statusCode ?? 0)")
            return
        }
        guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
            print( "DEBUG: Failed to decode JSON")
            return
        }
        
        self.coins = coins
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await fetchCoinsAsync()
        }
    }
}


// MARK: - URLSession

extension ContentViewModel {
    func fetchCoinsWithURLSession() {
        guard let url = URL(string: urlString) else {
            print("DEBUG: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
                        
            DispatchQueue.main.async {
                if let error = error {
                    print("DEBUG: Error \(error)")
                    return
                }
                
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    print("DEBUG: Server error")
                    return
                }
                
                guard let data = data else {
                    print("DEBUG: Invalid data")
                    return
                }
                
                guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
                    print("DEBUG: Invalid data")
                    return
                }
                            
                self.coins = coins
            }
        }.resume()
    }
}
