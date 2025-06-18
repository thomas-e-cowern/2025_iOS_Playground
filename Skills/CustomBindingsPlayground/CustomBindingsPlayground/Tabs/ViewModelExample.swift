//
//  ViewModelExample.swift
//  CustomBindingsPlayground
//
//  Created by Thomas Cowern on 6/18/25.
//

import SwiftUI

struct ViewModelExample: View {
    @State private var viewModel = ViewModel(firstName: "Stewart", lastName: "Lynch")
    var body: some View {
        NavigationStack {
            Text("Sometimes you find that you have some optional properties in a ViewModel that require a custom binding.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding()
            Form {
                Section("Working with ViewModels") {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                }
            }
            .navigationTitle("ViewModel Example")
        }
    }
}

#Preview {
    ViewModelExample()
}
