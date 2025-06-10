//
//  ChangePassword.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct ChangePassword: View {
    var body: some View {
        HStack {
            Image(systemName: "pencil.circle.fill")
                .font(.largeTitle)
            Text("Change Password View")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ChangePassword()
}
