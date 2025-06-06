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
            
            switch index {
            case 0:
                Home()
            case 1:
                Search()
            case 2:
                Favorites()
            case 3:
                Friends()
            default :
                Home()
            }
            
            CustomTabBar(index: $index)
        }
    }
}

#Preview {
    ContentView()
}
