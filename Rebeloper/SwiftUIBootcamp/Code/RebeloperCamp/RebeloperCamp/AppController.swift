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
    
    // MARK: - Firestore
    var profiles: [Profile] = []
    
    func createProfile(_ profile: Profile) throws {
        try APIService.createProfile(profile)
    }
    
    func fetchProfiles() async throws {
        profiles = try await APIService.fetchProfiles()
    }
}
