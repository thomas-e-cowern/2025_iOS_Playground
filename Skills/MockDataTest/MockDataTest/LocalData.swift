//
//  LocalData.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/22/25.
//

import Foundation

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // 1. Locate the file URL in the main app bundle
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    // 2. Load the file's contents into a Data object
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    // 3. Decode the Data into the specified Swift type T
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
