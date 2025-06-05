//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 6/5/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var index: Int = 0
    let backgroundGradient = LinearGradient(
        colors: [Color.red, Color.blue],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            
            backgroundGradient
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                if self.index == 0 {
                    Home()
                }
                if self.index == 1 {
                    
                }
                if self.index == 2 {
                    
                }
                if self.index == 3 {
                    
                }
                
                CustomTabBar(index: $index)
            }
        }
    }
}

#Preview {
    ContentView()
}
