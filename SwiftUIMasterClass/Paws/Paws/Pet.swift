//
//  Pet.swift
//  Paws
//
//  Created by Thomas Cowern on 2/10/25.
//

import Foundation
import SwiftData

@Model
final class Pet {
    var name: String
    @Attribute(.externalStorage) var photo: Data?
    
    init(name: String, photo: Data? = nil) {
        self.name = name
        self.photo = photo
    }
}

extension Pet {
    @MainActor
    static var preview: ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Pet.self, configurations: configuration)
        
        container.mainContext.insert(Pet(name: "Fido"))
        container.mainContext.insert(Pet(name: "Lily"))
        container.mainContext.insert(Pet(name: "Laddie Boy"))
        container.mainContext.insert(Pet(name: "Indy"))
        container.mainContext.insert(Pet(name: "Shorty"))
        container.mainContext.insert(Pet(name: "Rex"))
        container.mainContext.insert(Pet(name: "Poopy"))
        container.mainContext.insert(Pet(name: "Gummy"))
        
        return container
    }
}
