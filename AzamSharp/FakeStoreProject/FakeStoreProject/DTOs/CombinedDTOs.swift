//
//  CombinedDTO's.swift
//  FakeStoreProject
//
//  Created by Thomas Cowern on 7/23/25.
//

import Foundation

struct ResistrationResponse: Encodable  {
    let id: Int
    let email: String
    let password: String
    let name: String
    let avatar: URL
    let role: String
}
