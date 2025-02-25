//
//  Note.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/24/25.
//
import Foundation
import SwiftData

@Model
class Note {
    var title: String
    var body: String
    var dateCreated: Date
    @Attribute(.externalStorage) var photo: Data? = nil
    
    var myGardenVegatable: MyGardenVegetable?
    
    init(title: String, body: String, dateCreated: Date = Date()) {
        self.title = title
        self.body = body
        self.dateCreated = dateCreated
    }
}
