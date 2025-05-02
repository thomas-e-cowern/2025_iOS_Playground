//
//  ContentView.swift
//  FakeAPIClient
//
//  Created by Thomas Cowern on 5/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var apiService = APIService()
    
    var body: some View {
        VStack {
            NavigationStack {
                List(apiService.users) { user in
                    HStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text(user.name)
                    }
                }
            }
            .task {
                await apiService.fetchUsers()
            }
        }
    }
}

#Preview {
    ContentView()
}
