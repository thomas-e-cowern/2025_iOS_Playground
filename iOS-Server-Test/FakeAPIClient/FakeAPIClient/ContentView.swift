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
                Group {
                    switch apiService.state {
                    case .idle:
                        List(apiService.users) { user in
                            HStack {
                                Image(systemName: "globe")
                                    .imageScale(.large)
                                    .foregroundStyle(.tint)
                                Text(user.name)
                            }
                        }
                    case .loading:
                        ProgressView()
                            .controlSize(.large)
                    case .error(let error):
                        Text(error)
                            .foregroundStyle(.red)
                    }
                }
            }
            .task {
                await apiService.fetchUsers()
            }
            .toolbar {
                Button {
                    Task {
                        await apiService.fetchUsers()
                    }
                } label: {
                    Text("Reload")
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
