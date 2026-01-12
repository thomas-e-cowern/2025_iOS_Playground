//
//  Settings.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationStack {
            List(1...5, id: \.self) { index in
                NavigationLink("Settings \(index)", destination: Text("Settings Page number \(index)"))
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    Settings()
}
