//
//  Article.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/7/25.
//
import Foundation

struct Article: Codable, Hashable, Identifiable {
    let id: String
    let title: String
    let text: String
    
    var description: String
    var thumbnail: URL
    var date: Date
    var author: String
    
    var section: String
    var image: URL
    var url: URL
    
    static let example = Article(
        id: "1",
        title: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        description: "This is the description for this story",
        thumbnail: URL(string: "https://fastly.picsum.photos/id/1/5000/3333.jpg?hmac=Asv2DU3rA_5D1xSe22xZK47WEAN0wjWeFOhzd13ujW4")!,
        date: Date.now,
        author: "Stephen King",
        section: "Wierd World News",
        image: URL(string: "https://fastly.picsum.photos/id/36/4179/2790.jpg?hmac=OCuYYm0PkDCMwxWhrtoSefG5UDir4O0XCcR2x-aSPjs")!,
        url: URL(string: "https://www.theguardian.com/us-news/2025/jun/07/puppy-mill-north-carolina")!
        
        
    )
}
