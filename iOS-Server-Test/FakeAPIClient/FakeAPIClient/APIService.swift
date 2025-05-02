//
//  APIService.swift
//  FakeAPIClient
//
//  Created by Thomas Cowern on 5/2/25.
//
import SwiftUI
import Observation

enum FetchState {
    case idle
    case loading
    case error(String)
}

@Observable
class APIService {
    var state: FetchState = .idle
    var users: [User] = []
    
    func fetchUsers() async {
        
        state = .loading
        
        guard let url = URL(string: "http://localhost:8080/users") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                state = .error("No valid HTTP response")
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                state = .error("Error fetching data: \(httpResponse.statusCode)")
                return
            }
            
            users = try JSONDecoder().decode([User].self, from: data)
            
            state = .idle
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
                state = .error(error.localizedDescription)
        }
    }
}

