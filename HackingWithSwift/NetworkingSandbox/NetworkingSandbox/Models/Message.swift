//
//  Message.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 10/17/25.
//

import Foundation

struct Message: Decodable, Identifiable {
    var id: Int
    var from: String
    var text: String
}
