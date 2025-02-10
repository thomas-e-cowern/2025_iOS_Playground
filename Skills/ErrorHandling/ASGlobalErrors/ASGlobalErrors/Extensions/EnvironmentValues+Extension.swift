//
//  EnvironmentValues+Extension.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

extension EnvironmentValues {
    var showError: (Error, String, String) -> Void {
        get { self[ShowErrorEnvironmentKey.self] }
        set { self[ShowErrorEnvironmentKey.self] = newValue }
    }
}
