//
//  BudgetDetailScreen.swift
//  SDBudgetAppWithTesting
//
//  Created by Thomas Cowern on 3/11/25.
//

import SwiftUI
import SwiftData

struct BudgetDetailScreen: View {
    
    // MARK: - Properties
    let budget: Budget
    
    @State private var note: String = ""
    @State private var amount: Double?
    @State private var date: Date = Date()
    @State private var hasReceipt: Bool = false
    
    private var isFormValid: Bool {
        !note.trimmingCharacters(in: .whitespaces).isEmpty && amount != nil
    }
    
    // MARK: - Body
    var body: some View {
        Form {
            Section("Add Transaction to \(budget.name)") {
                TextField("Note", text: $note)
                TextField("Amount", value: $amount, format: .number)
                DatePicker("Date", selection: $date)
                Toggle("Receipt", isOn: $hasReceipt)
                Button("Save Transaction") {
                    saveTransaction()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .disabled(!isFormValid)
            } // MARK: - End of Section
            
            Section("Transactions for \(budget.name)") {
                List(budget.transactions) { transaction in
                    HStack {
                        Text(transaction.note)
                        Spacer()
                        Text(transaction.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }// MARK: - End of list
                
            }
        }// MARK: - End of form
        .navigationTitle(budget.name)
        .overlay {
            if budget.transactions.isEmpty {
                VStack {
                    Spacer()
                        .frame(height: 200)
                    ContentUnavailableView {
                        Label("No Transactions Found", systemImage: "person.circle")
                    } description: {
                        Text("You have no transactions for your \(budget.name)")
                    }
                }
            }
        }  // MARK: - End of Overlay
    }
    
    // MARK: - Methods and functions
    private func saveTransaction() {
        let transaction = Transaction(note: note, amount: amount ?? 0.0, date: date, hasReceipt: hasReceipt)
        transaction.budget = budget
        budget.addTransaction(transaction)
    }
}

struct BudgetDetailContainerView: View {
    
    @Query private var budgets: [Budget]
    
    var body: some View {
        NavigationStack {
            BudgetDetailScreen(budget: budgets.first!)
        }
    }
}

#Preview {
//    NavigationStack {
//        BudgetDetailScreen(budget: Budget(name: "Europe Trip", limit: 5700))
//    }
    
    BudgetDetailContainerView()
        .modelContainer(previewContainer)
}
