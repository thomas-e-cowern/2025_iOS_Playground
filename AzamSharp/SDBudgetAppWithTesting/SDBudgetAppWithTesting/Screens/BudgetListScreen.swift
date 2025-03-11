//
//  BudgetListScreen.swift
//  SDBudgetAppWithTesting
//
//  Created by Thomas Cowern on 3/10/25.
//

import SwiftUI
import SwiftData

struct BudgetListScreen: View {
    
    // MARK: - Properties
    @Environment(\.modelContext) private var context
    @Query private var budgets: [Budget]
    
    @State private var name: String = ""
    @State private var limit: Double?
    
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && limit != nil
    }
    
    var body: some View {
        
        VStack(spacing: 12) {
            Form {
                Section("New Budget") {
                    TextField("Budget Name", text: $name)
                    TextField("Budget Amount", value: $limit, format: .number)
                        .keyboardType(.numberPad)
                }
                
                Section("Budgets") {
                    List(budgets) { budget in
                        HStack {
                            Text(budget.name)
                            Spacer()
                            Text(budget.limit, format: .currency(code: Locale.current.identifier))
                        }
                    }
                }
            }
        }
        
        VStack {
            Button("Add Budget") {
                saveBudget()
            }
            .disabled(!isFormValid)
        }
        .navigationTitle("Budgets")
        
    }
    
    // MARK: - Methods and functions
    private func saveBudget() {
        let budget = Budget(name: name, limit: limit!)
        context.insert(budget)
        name = ""
        limit = nil
    }
}

#Preview {
    BudgetListScreen()
        .modelContainer(for: Budget.self)
}
