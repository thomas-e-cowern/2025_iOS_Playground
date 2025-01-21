//
//  ContentView.swift
//  SwiftUIError
//
//  Created by Thomas Cowern on 1/21/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var usersViewModel = UsersViewModel()
    
    @State private var isShowingWholeErrorView = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Whole Error View", destination: WholeErrorView())
                NavigationLink("Alert Modifier Error View", destination: AlertModifierErrorView())
                
            }
            .navigationTitle("Three Ways to Show Errors")
        }
    }
}

#Preview {
    ContentView()
}
