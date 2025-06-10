//
//  Profile.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .font(.largeTitle)
            Text("Profile View")
                .font(.largeTitle)
        }
    }
}

#Preview {
    Profile()
}
