//
//  Profile.swift
//  ShortSwiftUI
//
//  Created by Thomas Cowern on 1/25/25.
//

import Foundation

struct Profile: Codable, Identifiable, Hashable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
