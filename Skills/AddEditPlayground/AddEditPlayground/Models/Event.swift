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
    var details: String

    init(name: String, location: String, details: String, metAt: Event? = nil) {
        self.name = name
        self.location = location
        self.details = details
        self.metAt = metAt
    }
    
    var people = [Person]()
    
    var metAt: Event?
}
