//
//  Capsule.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

//import Foundation
//
//struct Capsule: Codable, Hashable {
//    let reuseCount, waterLandings, landLandings: Int
//    let lastUpdate: String
//    let launches: [String]
//    let serial, status, type, id: String
//
//    enum CodingKeys: String, CodingKey {
//        case reuseCount = "reuse_count"
//        case waterLandings = "water_landings"
//        case landLandings = "land_landings"
//        case lastUpdate = "last_update"
//        case launches, serial, status, type, id
//    }
//    
//    func load<T: Decodable>(_ filename: String) -> T {
//        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//        }
//
//        guard let data = try? Data(contentsOf: file) else {
//            fatalError("Couldn't load \(filename) from main bundle.")
//        }
//
//        let decoder = JSONDecoder()
//
//        do {
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//        }
//    }
//}
