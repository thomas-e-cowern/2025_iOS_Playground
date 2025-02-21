//
//  MyGardenView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/21/25.
//

import SwiftUI
import SwiftData

struct MyGardenView: View {
    
    @Query private var myGardenVegetabes: [MyGardenVegetable]
    var body: some View {
        List(myGardenVegetabes) { myVeggy in
            MyGardenCellView(myGardenVegetable: myVeggy)
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview("Light Mode") {
    NavigationStack {
        MyGardenView()
    }
    .modelContainer(previewContainer)
    .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    NavigationStack {
        MyGardenView()
    }
    .modelContainer(previewContainer)
    .preferredColorScheme(.dark)
}

