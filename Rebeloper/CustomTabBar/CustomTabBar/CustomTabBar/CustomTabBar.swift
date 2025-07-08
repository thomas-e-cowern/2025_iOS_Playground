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
        Text("Custom Tab Bar")
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
}

#Preview {
    
    @Previewable @Namespace var animation
    
    CustomTabBar(selectedTab: .constant("Home"), animation: animation)
}
