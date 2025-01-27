//
//  AppController.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/26/25.
//

import SwiftUI

@Observable
class AppController {
    var profile = Profile()
    
    func changeName() {
        profile.name = "New Name"
    }
}
