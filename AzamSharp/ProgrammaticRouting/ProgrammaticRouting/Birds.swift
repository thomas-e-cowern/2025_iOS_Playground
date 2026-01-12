//
//  Birds.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import Foundation

struct Birds: Identifiable {
    var id: Int
    var name: String
    var color: String
    
    static var example: [Birds] {
        [
        Birds(id: 1, name: "Peregrine", color: "Red"),
        Birds(id: 2, name: "Blue Jay", color: "Blue"),
        Birds(id: 3, name: "American Robin", color: "Red")
        ]
    }
}
