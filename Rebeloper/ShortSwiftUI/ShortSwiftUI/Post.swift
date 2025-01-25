//
//  Post.swift
//  ShortSwiftUI
//
//  Created by Thomas Cowern on 1/25/25.
//

import Foundation

struct Post: Codable, Identifiable, Hashable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
