//
//  MockDataDecoder.swift
//  SpaceXTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

struct MockDataDecoder {
    func loadMockData<T: Decodable>(_ filename: String) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't find \(filename).json in main bundle.")
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't load or parse \(filename).json: \(error)")
        }
    }

}
