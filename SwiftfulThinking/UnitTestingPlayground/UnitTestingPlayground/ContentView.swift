//
//  ContentView.swift
//  UnitTestingPlayground
//
//  Created by Thomas Cowern on 3/18/25.
//
// 1. Unit Tests - test the business logic of an app


import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm: UnitTestingPlaygroundViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingPlaygroundViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(vm.isPremium.description)
        }
        .padding()
    }
}

#Preview {
    ContentView(isPremium: true)
}
