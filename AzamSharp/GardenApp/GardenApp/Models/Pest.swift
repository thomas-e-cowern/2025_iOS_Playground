//
//  Pest.swift
//  GardenApp
//
//  Created by Thomas Cowern on 4/8/25.
//

import Foundation
import SwiftData

@Model
class Pest: Decodable {
    var name: String
    var body: String
    var symptoms: String
    var treatment: String
    var photo: String
    var vegetable: Vegetable?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.body = try container.decode(String.self, forKey: .body)
        self.symptoms = try container.decode(String.self, forKey: .symptoms)
        self.treatment = try container.decode(String.self, forKey: .treatment)
        self.photo = try container.decode(String.self, forKey: .photo)
    }
    
    enum CodingKeys: String, CodingKey {
        case name, symptoms, treatment, photo
        case body = "description"
    }
    
}
