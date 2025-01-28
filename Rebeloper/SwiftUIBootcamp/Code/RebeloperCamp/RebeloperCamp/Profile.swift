//
//  Profile.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/27/25.
//

import Foundation

struct Profile: Codable {
    var name: String
    
    init(name: String? = nil) {
        self.name = name ?? ""
    }
}
