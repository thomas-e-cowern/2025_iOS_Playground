//
//  ContentView.swift
//  ApiServiceTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var data   // <- Observation-style environment access

        var body: some View {
            List(data.users) { u in
                VStack(alignment: .leading) {
                    Text(u.name).font(.headline)
                    Text(u.email).foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Users")
        }
}

#Preview {
    ContentView()
        .withMockData()
}
