//
//  Hater.swift
//  FirstTesting
//
//  Created by Thomas Cowern on 3/19/25.
//

import Foundation

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
    
    mutating func hadAGoodDay() {
        hating = false
    }
}
