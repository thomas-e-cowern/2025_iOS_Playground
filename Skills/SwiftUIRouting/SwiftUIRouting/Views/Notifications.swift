//
//  Notifications.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

struct Notifications: View {
    var body: some View {
        HStack {
            Image(systemName: "antenna.radiowaves.left.and.right.circle.fill")
                .font(.largeTitle)
            Text("Notifications View")
                .font(.largeTitle)
        }
    }
}

#Preview {
    Notifications()
}
