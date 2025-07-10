//
//  Event.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/10/25.
//

import SwiftData

@Model
class Event {
    var name: String
    var location: String

    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
    
    var people = [Person]()
}
