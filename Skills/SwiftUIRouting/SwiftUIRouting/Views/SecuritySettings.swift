//
//  SecuritySettings.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct SecuritySettings: View {
    var body: some View {
        HStack {
            Image(systemName: "lock.shield")
                .font(.largeTitle)
            Text("Security Settings View")
                .font(.largeTitle)
        }
    }
}

#Preview {
    SecuritySettings()
}
