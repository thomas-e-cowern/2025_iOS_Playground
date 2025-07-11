//
//  CustomTabBarView.swift
//  DisapearingTabBar
//
//  Created by Thomas Cowern on 7/11/25.
//

import SwiftUI

struct CustomTabBarView: View {
    var body: some View {
        ZStack {
            HStack(spacing: 45) {
                Image(systemName: "house")
                    .font(.title)
                Image(systemName: "calendar")
                    .font(.title)
                Image(systemName: "bubble")
                    .font(.title)
                Image(systemName: "person")
                    .font(.title)
            }
            .foregroundStyle(.white)
            .padding()
            .background(Color.gray)
            .clipShape(.capsule)
        }
    }
}

#Preview {
    CustomTabBarView()
}
