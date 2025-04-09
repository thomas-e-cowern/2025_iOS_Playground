//
//  VegetableListView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/13/25.
//

import SwiftUI

struct VegetableListView: View {

    @State private var showAlert: Bool = false
    @State private var searchText: String = ""
    @StateObject private var vlViewModel = VegetableListViewModel()
    
    private var filteredVegetables: [Vegetable] {
        if searchText.isEmpty {
            return vlViewModel.vegetables
        } else {
            return vlViewModel.vegetables.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(filteredVegetables) { vegetable in
                    NavigationLink {
                        VegetableDetailScreen(vegetable: vegetable)
                    } label: {
                        VegetableRowView(vegetable: vegetable)
                    }

                }
            }
            .searchable(text: $searchText)
            .listStyle(.plain)
        }
        .navigationTitle("Vegetables")
        .onReceive(vlViewModel.$error, perform: { error in
            if error != nil {
                showAlert.toggle()
            } 
        })
        .alert("Error", isPresented: $showAlert) {
            Text(vlViewModel.error?.localizedDescription ?? "An unknow error occured.  Please try again later")
            Button("Ok") {}
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
