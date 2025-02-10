//
//  Helpers.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

struct ShowErrorEnvironmentKey: EnvironmentKey {
    static let defaultValue: (Error, String, String) -> Void = { _, _, _ in }
}
