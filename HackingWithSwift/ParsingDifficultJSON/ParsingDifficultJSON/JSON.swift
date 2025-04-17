//
//  JSON.swift
//  ParsingDifficultJSON
//
//  Created by Thomas Cowern on 4/17/25.
//
import SwiftUI

struct JSON: RandomAccessCollection {
    
    var value: Any?
    
    init(string: String) throws {
        let data = Data(string.utf8)
        value = try JSONSerialization.jsonObject(with: data)
    }

    init(value: Any?) {
        self.value = value
    }
    
    // Optional data types
    var optionalBool: Bool? {
        value as? Bool
    }

    var optionalDouble: Double? {
        value as? Double
    }

    var optionalInt: Int? {
        value as? Int
    }

    var optionalString: String? {
        value as? String
    }
    
    // Non optional data types
    var bool: Bool {
        optionalBool ?? false
    }

    var double: Double {
        optionalDouble ?? 0
    }

    var int: Int {
        optionalInt ?? 0
    }

    var string: String {
        optionalString ?? ""
    }
    
    // Optional array and dictionary
    var optionalArray: [JSON]? {
        let converted = value as? [Any]
        return converted?.map { JSON(value: $0) }
    }
    
    var optionalDictionary: [String: JSON]? {
        let converted = value as? [String: Any]
        return converted?.mapValues { JSON(value: $0) }
    }
    
    // Non optional array and dictionary
    var array: [JSON] {
        optionalArray ?? []
    }

    var dictionary: [String: JSON] {
        optionalDictionary ?? [:]
    }
    
    // Access arrays and dictionaries
    subscript(index: Int) -> JSON {
        optionalArray?[index] ?? JSON(value: nil)
    }

    subscript(key: String) -> JSON {
        optionalDictionary?[key] ?? JSON(value: nil)
    }
    
    // Index requirements for RandomAccessCollection
    var startIndex: Int { array.startIndex }
    var endIndex: Int { array.endIndex }
}
