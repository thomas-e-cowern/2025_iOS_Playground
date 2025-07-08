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
    
    var body: some View {
        Text("Custom Tab Bar")
    }
}

#Preview {
    
    @Previewable @Namespace var animation
    
    CustomTabBar(selectedTab: .constant("Home"), animation: animation)
}
