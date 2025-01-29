//
//  MainView.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/29/25.
//

import SwiftUI

struct MainView: View {
    
    @ScaledMetric var spacingSize: CGFloat = 10
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.green.ignoresSafeArea()
            
        }
//        .background(.red)
        .overlay {
            Text("Hello, World!")
        }
    }
}

#Preview {
    MainView()
}
