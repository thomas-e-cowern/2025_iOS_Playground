//
//  Endpoints.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 10/17/25.
//

import Foundation

struct Endpoint<T: Decodable> {
    var path: String
    var type: T.Type
    var method = HTTPMethod.get
    var headers = [String: String]()
    var keyPath: String?
}

extension Endpoint where T == [News] {
    static let headlines = Endpoint(path: "headlines.json", type: [News].self)
}

extension Endpoint where T == [Message] {
    static let messages = Endpoint(path: "messages.json", type: [Message].self)
}

extension Endpoint where T == String {
    static let city = Endpoint(path: "nested.json", type: String.self, keyPath: "response.user.address.city")
}
