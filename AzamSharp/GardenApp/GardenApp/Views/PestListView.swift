//
//  PestListView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 4/8/25.
//

import SwiftUI

struct PestListView: View {
    
    @StateObject private var vlViewModel = VegetableListViewModel()
    
    var body: some View {
        List {
            ForEach(vlViewModel.pests) { pest in
                PestCellView(pest: pest)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Pests")
    }
}

#Preview {
    PestListView()
}
