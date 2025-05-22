//
//  DiscussionListView.swift
//  TabViewTest
//
//  Created by Thomas Cowern on 5/21/25.
//

import SwiftUI

struct DiscussionListView: View {
    var body: some View {
        List {
            ForEach(0..<5) { _ in
                DiscussionListRowView()
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    DiscussionListView()
}
