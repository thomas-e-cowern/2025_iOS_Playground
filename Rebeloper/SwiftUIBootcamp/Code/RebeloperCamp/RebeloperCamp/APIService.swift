//
//  APIService.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/28/25.
//

import SwiftUI
import FirebaseFirestore

struct APIService {
    
    // MARK: - Methods and functions
    static func createProfile(_ profile: Profile) throws {
        let reference = Firestore.firestore().collection("profiles").document()
        try reference.setData(from: profile)
    }
    
    static func fetchProfiles() async throws -> [Profile] {
        let reference = Firestore.firestore().collection("profiles")
        let snapshot = try await reference.getDocuments()
        let documents = snapshot.documents.compactMap { snapshot in
            try? snapshot.data(as: Profile.self)
        }
        
        return documents
    }
}
