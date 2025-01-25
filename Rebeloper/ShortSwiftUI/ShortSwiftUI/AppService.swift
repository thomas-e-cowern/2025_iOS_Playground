//
//  AppService.swift
//  ShortSwiftUI
//
//  Created by Thomas Cowern on 1/25/25.
//

import SwiftUI

@Observable
class AppService {
    var posts = [Post]()
    
    var isDestinationShowing: Bool = false
    
    func fetchPosts() async throws {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        posts = try JSONDecoder().decode([Post].self, from: data)
        
    }
}
