//
//  ContentView.swift
//  CompositingGroupPlayground
//
//  Created by Thomas Cowern on 1/15/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill((Color(red: 1, green: 0, blue: 0)))
                .frame(width: 300, height: 200)
                .offset(x: 0, y: 50)
            
            Circle()
                .fill((Color(red: 0, green: 1, blue: 0)))
                .frame(width: 200, height: 200)
                .offset(x: 50, y: -50)
            
            Circle()
                .fill((Color(red: 0, green: 0, blue: 1)))
                .frame(width: 200, height: 200)
                .offset(x: -50, y: -50)
        }
    }
}

#Preview {
    ContentView()
}
