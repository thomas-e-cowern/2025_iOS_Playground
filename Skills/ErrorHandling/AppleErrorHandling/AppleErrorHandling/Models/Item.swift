//
//  Item.swift
//  AppleErrorHandling
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var price: Int
    var count: Int
}
