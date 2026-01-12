//
//  Home.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            List(1...10, id: \.self) { index in
                NavigationLink("Home \(index)", destination: Text("Home Page number \(index)"))
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    Home()
}
