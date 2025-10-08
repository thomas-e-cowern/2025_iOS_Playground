//
//  Capsule.swift
//  SpaceXTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

struct Capsule: Codable, Identifiable {
    let reuseCount, waterLandings, landLandings: Int
    let lastUpdate: String?
    let launches: [String]
    let serial, status, type, id: String

    enum CodingKeys: String, CodingKey {
        case reuseCount = "reuse_count"
        case waterLandings = "water_landings"
        case landLandings = "land_landings"
        case lastUpdate = "last_update"
        case launches, serial, status, type, id
    }
}
