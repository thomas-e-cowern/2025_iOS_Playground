//
//  UserViewModel.swift
//  Errors
//
//  Created by Thomas Cowern on 2/11/25.
//

import Foundation

@Observable
class UserViewModel {
    
    func fetchUsers() async throws -> [User] {
        
        //create a new urlRequest passing the url
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            throw NetworkError.invalidURL
        }
        
        let request = URLRequest(url: url)
        
        //run the request and retrieve both the data and the response of the call
        let (data, _) = try await URLSession.shared.data(for: request)
        
        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let fetchedData = try JSONDecoder().decode([User].self, from: data)
        
        return fetchedData
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
