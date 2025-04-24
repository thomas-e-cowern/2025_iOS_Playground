//
//  Untitled.swift
//  TabViewPlayground
//
//  Created by Thomas Cowern on 4/24/25.
//
import SwiftUI

struct BadmintonView: View {
    
    @Environment(AppController.self) private var appController
    
    var body: some View {
        VStack {
            Image(systemName: "figure.badminton")
                .font(.system(size: 100))
                .foregroundStyle(.secondary)
            
            Button("Switch to archery") {
                withAnimation {
                    appController.selectedTabIndex = .archery
                }
            }
        }
    }
}

#Preview {
    BadmintonView()
        .environment(AppController())
}
