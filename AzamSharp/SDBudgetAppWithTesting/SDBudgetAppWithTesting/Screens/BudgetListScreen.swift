//
//  BudgetListScreen.swift
//  SDBudgetAppWithTesting
//
//  Created by Thomas Cowern on 3/10/25.
//

import SwiftUI
import SwiftData

struct BudgetListScreen: View {
    
    @State private var name: String = ""
    @State private var limit: Double?
    
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && limit != nil
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Form {
                    Section("New Budget") {
                        TextField("Budget Name", text: $name)
                        TextField("Budget Amount", value: $limit, format: .number)
                            .keyboardType(.numberPad)
                    }
                }
            }
            
            VStack {
                Button("Add Budget") {
                    // MARK: TODO - Code to add the budget
                }
                .disabled(!isFormValid)
            }
            .navigationTitle("Budgets")
        }
    }
    
    // MARK: - Methods and functions
    private func saveBudget() {
        let budget = Budget(name: name, limit: limit!)
    }
}

#Preview {
    BudgetListScreen()
        .modelContainer(for: Budget.self)
}
