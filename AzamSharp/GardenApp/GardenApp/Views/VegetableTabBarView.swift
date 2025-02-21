//
//  VegetableTabBarView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/14/25.
//

import SwiftUI

struct VegetableTabBarView: View {
    var body: some View {
        TabView {
            Tab("Vegetables", systemImage: "leaf") {
                NavigationStack {
                    VegetableListView()
                }
            }
            
            Tab("My Garden", systemImage: "house") {
                NavigationStack {
                    MyGardenView()
                }
            }
            
            Tab("Pests", systemImage: "ladybug") {
                NavigationStack {
                    Text("Pests View")
                }
            }
        }
        .tint(.green)
    }
}

#Preview {
    VegetableTabBarView()
        .modelContainer(previewContainer)
}
