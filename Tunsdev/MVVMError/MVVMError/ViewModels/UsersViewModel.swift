//
//  UsersViewModel.swift
//  MVVMError
//
//  Created by Thomas Cowern on 2/11/25.
//

import SwiftUI
import Foundation

@Observable
final class UsersViewModel: Error {
    
    var hasError: Bool = false
    var networkError: NetworkError?
    var urlError: URLError?
    
    func fetchUsers() async throws -> [User] {
        
        print(networkError)
        
        hasError = false
        
        //create the new url
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/x")
        
        //create a new urlRequest passing the url
        if let url = url {
            let request = URLRequest(url: url)
            
            //run the request and retrieve both the data and the response of the call
            let (data, response) = try await URLSession.shared.data(for: request)
            
            //checks if there are errors regarding the HTTP status code and decodes using the passed struct
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let fetchedData = try JSONDecoder().decode([User].self, from: ErrorResponseHandler().handleResponse(response: (data, response)))

            return fetchedData
            
        } else {
            // Return url error
            self.hasError = true
            self.urlError = URLError.invalidURL
            throw URLError.invalidURL
        }
    }
}
