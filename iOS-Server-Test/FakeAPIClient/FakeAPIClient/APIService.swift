//
//  APIService.swift
//  FakeAPIClient
//
//  Created by Thomas Cowern on 5/2/25.
//
import SwiftUI
import Observation

@Observable
class APIService {
    var users: [User] = []
    
    func fetchUsers() async {
        
        guard let url = URL(string: "http://localhost:8080/users") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("No HTTP response")
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                print("Http Response status code is not in the 2xx range: \(httpResponse.statusCode)")
                return
            }
            
            users = try JSONDecoder().decode([User].self, from: data)
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
        }
    }
}

