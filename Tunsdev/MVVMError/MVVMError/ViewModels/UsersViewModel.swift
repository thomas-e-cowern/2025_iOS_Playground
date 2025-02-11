//
//  UsersViewModel.swift
//  MVVMError
//
//  Created by Thomas Cowern on 2/11/25.
//

import SwiftUI
import Foundation

@Observable
final class UsersViewModel {
    func fetchUsers() async throws -> [User] {
        
        //create the new url
        let url = URL(string: "https://jsonplaceholder.typicode.com/users1")
        
        //create a new urlRequest passing the url
        let request = URLRequest(url: url!)
        
        //run the request and retrieve both the data and the response of the call
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print("Response: \(response)")
        
        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let fetchedData = try JSONDecoder().decode([User].self, from: ResponseHandler().handelResponse(response: (data, response)))
        
        print("Fetched Data: \(fetchedData)")
        
        return []
    }
}
