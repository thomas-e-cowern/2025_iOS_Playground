//
//  PreviewData.swift
//  DummyDataTest
//
//  Created by Thomas Cowern on 1/15/25.
//

import Foundation

class PreviewData {
    
    static func load<T: Codable>(name: String) -> [T] {
        
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(filePath: path))
                let reults = try JSONDecoder().decode([T].self, from: data)
                return reults
            } catch {
                return []
            }
        }
        
        return []
    }
}
