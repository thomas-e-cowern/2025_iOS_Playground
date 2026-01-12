//
//  ContentView.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: AppScreen? = .home
    
    var body: some View {
        AppTabView(selection: $selection)
    }
}

#Preview {
    ContentView()
}
