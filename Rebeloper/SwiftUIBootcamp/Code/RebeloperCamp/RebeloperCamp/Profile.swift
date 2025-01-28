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
    
    init(name: String? = nil) {
        self.name = name ?? ""
    }
}
