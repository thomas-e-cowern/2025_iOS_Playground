//
//  Settings.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        HStack {
            Image(systemName: "gear.circle")
                .font(.largeTitle)
            Text("Settings View")
                .font(.largeTitle)
        }
    }
}

#Preview {
    Settings()
}
