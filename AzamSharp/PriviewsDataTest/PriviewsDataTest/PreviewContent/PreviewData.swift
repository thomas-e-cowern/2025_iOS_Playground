//
//  PreviewData.swift
//  PriviewsDataTest
//
//  Created by Thomas Cowern on 6/12/25.
//

import Foundation

struct PreviewData {
    
    static func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
        print("Inside PreviewData.load()\n")
        let data: Data
        
        // Find the file
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't find \(filename).json in the main bundle")
        }
        
        // Load data
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Unable to load data from \(filename).json.  Error: \(error.localizedDescription)")
        }
        
        // Decode json
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Unable to decode data from \(filename).json.  Error: \(error.localizedDescription)")
        }
    }
}
