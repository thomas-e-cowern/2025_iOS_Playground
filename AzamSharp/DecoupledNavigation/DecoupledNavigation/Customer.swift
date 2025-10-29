//
//  Custoner.swift
//  DecoupledNavigation
//
//  Created by Thomas Cowern on 10/29/25.
//

import Foundation

struct Customer: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let address: String
}
