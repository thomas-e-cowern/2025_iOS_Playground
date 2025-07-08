//
//  AccountView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 7/8/25.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            
            Color.red.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            HStack {
                Image(systemName: "person")
                    .font(.title)
                Text("Account Info")
                    .font(.title)
            }
        }
    }
}

#Preview {
    AccountView()
}
