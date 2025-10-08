//
//  ContentView.swift
//  SpaceXTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var capsuleVM = DataViewModel()
    
    var body: some View {
        NavigationStack {
            List(capsuleVM.capsules) { capsule in
                NavigationLink {
                    CapsuleDetailView(capsule: capsule)
                } label: {
                    CapsuleRowView(capsule: capsule)
                }

            }
            .navigationTitle("Capsule Info")
        }
    }
}

#Preview {
    ContentView()
}
