//
//  Feature.swift
//  WelcomeScreen
//
//  Created by Thomas Cowern on 10/24/25.
//

import Foundation

struct Feature: Decodable, Identifiable {
    var id: Int
    let title: String
    let description: String
    let image: String
}
