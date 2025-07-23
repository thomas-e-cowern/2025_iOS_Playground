//
//  String+Extensions.swift
//  FakeStoreProject
//
//  Created by Thomas Cowern on 7/23/25.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
