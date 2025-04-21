//
//  AppIntentController.swift
//  AppIntentDemo
//
//  Created by Thomas Cowern on 4/21/25.
//

import SwiftUI

@Observable
class AppIntentController {
    
    static let shared = AppIntentController()
    
    var focusedField: FocusedField = .none
    
}

