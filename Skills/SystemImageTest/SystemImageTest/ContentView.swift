//
//  ContentView.swift
//  SystemImageTest
//
//  Created by Thomas Cowern on 6/24/25.
//

import SwiftUI

enum Icons: String, CaseIterable, Identifiable {
    case star = "star.fill"
    case swirl = "swirl.circle.righthalf.filled.inverse"
    case circle = "circle.dotted.circle.fill"
    case person = "person.fill"
    case sun = "sun.min.fill"
    var id: Self { self }
}

struct ContentView: View {
    
    @State private var selectedIcon: Icons = .star
    
    var body: some View {
        VStack {
            List {
                Picker("Icons", selection: $selectedIcon) {
                    ForEach(Icons.allCases) { icon in
                        Image(systemName: icon.rawValue)
                    }
                }
            }
            
            Image(systemName: selectedIcon.rawValue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
