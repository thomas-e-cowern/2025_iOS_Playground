//
//  AppControllerKey.swift
//  MacroPlayground
//
//  Created by Thomas Cowern on 4/19/25.
//
import SwiftUI

struct AppControllerKey: @preconcurrency EnvironmentKey {
    @MainActor
    static let defaultValue = AppController()
}

extension EnvironmentValues {
    var appController: AppController {
        get {
            self[AppControllerKey.self]
        } set {
            self[AppControllerKey.self] = newValue
        }
    }
}
