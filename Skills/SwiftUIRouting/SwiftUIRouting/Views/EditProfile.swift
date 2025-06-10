//
//  EditProfile.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct EditProfile: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .font(.largeTitle)
            Text("Edit Profile View")
                .font(.largeTitle)
        }
    }
}

#Preview {
    EditProfile()
}
