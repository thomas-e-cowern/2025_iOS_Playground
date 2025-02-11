//
//  User.swift
//  MVVMError
//
//  Created by Thomas Cowern on 2/11/25.
//

import Foundation

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let name, email: String
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
