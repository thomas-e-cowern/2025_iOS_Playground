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
            TextField("Note", text: $note)
            TextField("Amount", value: $amount, format: .number)
            DatePicker("Date", selection: $date)
            Toggle("Receipt", isOn: $hasReceipt)
            Button("Save Transaction") {
                // MARK: TODO - Add saveTransaction here...
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .disabled(!isFormValid)
        }
        .navigationTitle("Add Transaction")
    }
    
    // MARK: - Methods and functions
    private func saveTransaction() {
        let transaction = Transaction(note: note, amount: amount ?? 0.0, date: date, hasReceipt: hasReceipt)
        transaction.budget = budget
        budget.addTransaction(transaction)
    }
}

#Preview {
    NavigationStack {
        BudgetDetailScreen(budget: Budget(name: "Europe Trip", limit: 5700))
    }
}
