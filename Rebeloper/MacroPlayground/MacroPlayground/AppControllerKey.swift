//
//  AppControllerKey.swift
//  MacroPlayground
//
//  Created by Thomas Cowern on 4/19/25.
//
import SwiftUI

// Create a key for our controller and using injection
//struct AppControllerKey: @preconcurrency EnvironmentKey {
//    @MainActor
//    static let defaultValue = AppController()
//}
//
//extension EnvironmentValues {
//    var appController: AppController {
//        get {
//            self[AppControllerKey.self]
//        } set {
//            self[AppControllerKey.self] = newValue
//        }
//    }
//}

// Using the @Entry macro to do the same thing.
extension EnvironmentValues {
    @Entry
    var appController = AppController()
}
