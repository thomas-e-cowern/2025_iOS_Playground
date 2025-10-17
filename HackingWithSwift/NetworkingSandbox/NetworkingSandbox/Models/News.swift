//
//  News.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 10/17/25.
//

import Foundation

struct News: Decodable, Identifiable {
    var id: Int
    var title: String
    var strap: String
    var url: URL
}
