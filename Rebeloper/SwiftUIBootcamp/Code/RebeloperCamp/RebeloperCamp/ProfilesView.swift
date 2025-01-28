//
//  ProfilesView.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/28/25.
//

import SwiftUI

struct ProfilesView: View {
    
    @Environment(AppController.self) private var appController
    
    var body: some View {
        VStack {
            if appController.profiles.isEmpty {
                Text("No Profiles Available")
            } else {
                List {
                    ForEach(appController.profiles) { profile in
                        HStack {
                            Text("Name: " + profile.name)
                            Spacer()
                            Text("Score: \(profile.score)")
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    createProfile()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await appController.fetchProfiles()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: - Methods and functions
    func createProfile() {
        Task {
            do {
                let profile = Profile(name: "New Profile")
                try appController.createProfile(profile)
                try await appController.fetchProfiles()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfilesView()
            .environment(AppController())
    }
}
