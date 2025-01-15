//
//  Message.swift
//  DummyDataTest
//
//  Created by Thomas Cowern on 1/15/25.
//

import Foundation

struct Message: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
