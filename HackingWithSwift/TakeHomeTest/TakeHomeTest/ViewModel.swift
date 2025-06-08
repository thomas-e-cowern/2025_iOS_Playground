//
//  ViewModel.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/8/25.
//
import SwiftUI

extension ContentView {
    @Observable @MainActor
    class ViewModel {
        
        private(set) var articles: [Article] = []
        
        func loadArticles() async {
            do {
                let url = URL(string: "https://www.hackingwithswift.com/samples/news")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                articles = try decoder.decode([Article].self, from: data)
            } catch {
                print("Error in loadArticles: \(error.localizedDescription)")
            }
        }
    }
}
