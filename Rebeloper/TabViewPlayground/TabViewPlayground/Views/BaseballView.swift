//
//  BaseballView.swift
//  TabViewPlayground
//
//  Created by Thomas Cowern on 4/24/25.
//

import SwiftUI

struct BaseballView: View {
    var body: some View {
        Image(systemName: "figure.baseball")
            .font(.system(size: 100))
            .foregroundStyle(.secondary)
    }
}

#Preview {
    BaseballView()
}
