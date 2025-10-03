//
//  UserListView.swift
//  MockAPITest
//
//  Created by Thomas Cowern on 10/3/25.
//

import SwiftUI

struct UserListView: View {
    @Environment(\.userRepository) private var repo
    @State private var users: [User] = []
    @State private var errorMessage: String?

    var body: some View {
        List(users) { user in
            VStack(alignment: .leading) {
                Text(user.name).font(.headline)
                Text(user.email).foregroundStyle(.secondary)
            }
        }
        .overlay {
            if let msg = errorMessage {
                ContentUnavailableView("Unable to load users", systemImage: "exclamationmark.triangle", description: Text(msg))
            }
        }
        .task {
            do { users = try repo.allUsers() }
            catch { errorMessage = error.localizedDescription }
        }
    }
}

#Preview("Users (Mock JSON)") {
    // Fallback sample shown ONLY if the file is missing/invalid in previews
    let sample: [User] = [
        .init(id: 1, name: "Preview Alice", email: "alice@example.com"),
        .init(id: 2, name: "Preview Bob",   email: "bob@example.com")
    ]

    // Force-load once so the preview never crashes
    let users: [User] = (try? loadMock("Mock/users.json", fallback: sample)) ?? sample

    return NavigationStack {
        List(users) { user in
            VStack(alignment: .leading) {
                Text(user.name).font(.headline)
                Text(user.email).foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Users")
    }
    // You can still inject repos if your view expects them:
    .environment(\.userRepository, MockUserRepository())
}
