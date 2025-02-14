//
//  VegetableListView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/13/25.
//

import SwiftUI

struct VegetableListView: View {
    
    @State private var vegatables: [Vegetable] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(vegatables) { vegetable in
                    VegetableRowView(vegetable: vegetable)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Vegetables")
        .task {
            do {
                let client = HTTPService()
                vegatables = try await client.fetchVegatables()
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}

#Preview("Light Mode") {
    NavigationStack {
        VegetableListView()
            .preferredColorScheme(.light)
    }
}

#Preview("Dark Mode") {
    NavigationStack {
        VegetableListView()
            .preferredColorScheme(.dark)
    }
}
