//
//  PestListView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 4/8/25.
//

import SwiftUI

struct PestListView: View {
    
    @StateObject private var vlViewModel = VegetableListViewModel()
    @State private var searchText: String = ""
    
    private var filteredPests: [Pest] {
        if searchText.isEmpty {
            return vlViewModel.pests
        } else {
            return vlViewModel.pests.filter {
                $0.name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(filteredPests) { pest in
                    PestCellView(pest: pest)
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
        }
        .navigationTitle("Pests")
    }
}

#Preview {
    NavigationStack {
        PestListView()
    }
}
