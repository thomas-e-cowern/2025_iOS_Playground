//
//  Article.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/7/25.
//
import Foundation

struct Article: Codable, Hashable, Identifiable {
    let id: String
    let title: String
    let text: String
}
