//
//  Image+Extensions.swift
//  MockDataTest
//
//  Created by Thomas Cowern on 12/21/25.
//

import SwiftUI

extension Image {
    init(assetName name: String, fallback systemName: String = "photo.fill") {
        if UIImage(named: name) != nil {
            self = Image(name)
        } else {
            self = Image(systemName: systemName)
        }
    }
}
