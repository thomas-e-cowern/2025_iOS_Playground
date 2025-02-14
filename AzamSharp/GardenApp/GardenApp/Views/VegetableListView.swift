//
//  VegetableListView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/13/25.
//

import SwiftUI

struct VegetableListView: View {

    @State private var showAlert: Bool = false
    @StateObject private var vlViewModel = VegetableListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(vlViewModel.vegetables) { vegetable in
                    NavigationLink {
                        VegetableDetailScreen(vegetable: vegetable)
                    } label: {
                        VegetableRowView(vegetable: vegetable)
                    }

                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Vegetables")
        .onReceive(vlViewModel.$error, perform: { error in
            if error != nil {
                print("Error")
                showAlert.toggle()
            } else {
                print("No Error")
            }
        })
        .alert("Error", isPresented: $showAlert) {
            Text(vlViewModel.error?.localizedDescription ?? "")
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
