//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 7/8/25.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
    var animation: Namespace.ID
    
    let tabs: [String] = ["Home", "Search", "Account"]
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabItem(for: tab)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(Color(.systemBackground).shadow(radius: 5))
        
    }
    
    private func icon(for tabs: String) -> String {
        switch tabs {
        case "Home":
            return "house"
        case "Search":
            return "magnifyingglass"
        case "Account":
            return "person.circle"
        default:
            return "quationmark"
        }
    }
    
    private func tabItem(for tab: String) -> some View {
        Text(tab)
    }
}

#Preview {
    
    @Previewable @Namespace var animation
    
    CustomTabBar(selectedTab: .constant("Home"), animation: animation)
}
