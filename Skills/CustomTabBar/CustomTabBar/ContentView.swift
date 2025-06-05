//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var index: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            CustomTabBar(index: $index)
        }
    }
}

#Preview {
    ContentView()
}
