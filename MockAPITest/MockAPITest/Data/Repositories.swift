//
//  Repositories.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

import Foundation

protocol UserRepository {
    func allUsers() throws -> [User]
    func user(id: Int) throws -> User?
}

struct MockUserRepository: UserRepository {
    private let filename: String
    init(filename: String = "/Data/Mock/users.json") {
        self.filename = filename
    }
    func allUsers() throws -> [User] {
        try loadMock(filename)
    }
    func user(id: Int) throws -> User? {
        try allUsers().first { $0.id == id }
    }
}
