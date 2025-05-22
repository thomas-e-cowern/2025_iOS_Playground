//
//  DiscussionListNavigationLinkView.swift
//  TabViewTest
//
//  Created by Thomas Cowern on 5/21/25.
//

import SwiftUI

struct DiscussionListNavigationLinkView: View {
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 12, bottomTrailingRadius: 12)
                .foregroundStyle(Color(.systemGray))
            
            NavigationLink(destination: Text("Coming Soon")) {
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 12)
                        .foregroundStyle(.purple)
                        .offset(y: 5)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Discussion List")
                            .font(.headline)
                        Text("View all discussions")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray))
                    }
                    
                    Spacer()
                    
                    DiscussionListAvatarsView()
                }
                .padding()
            }
            .padding(.trailing)
        }
    }
}

#Preview {
    DiscussionListNavigationLinkView()
}
