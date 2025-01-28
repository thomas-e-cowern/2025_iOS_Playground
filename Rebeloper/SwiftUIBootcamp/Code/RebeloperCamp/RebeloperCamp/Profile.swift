//
//  Profile.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/27/25.
//

import SwiftUI

struct Profile: Codable, Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var score: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case score
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let score = try container.decode(Int.self, forKey: .score)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "Empty"
        self.score = try container.decode(Int.self, forKey: .score)
    }
    
    init(name: String? = nil, score: Int? = nil) {
        self.name = name ?? ""
        self.score = score ?? 0
    }
}
