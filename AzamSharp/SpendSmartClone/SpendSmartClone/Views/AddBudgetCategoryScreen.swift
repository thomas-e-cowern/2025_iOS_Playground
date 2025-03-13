//
//  AddBudgetCategoryScreen.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//
import SwiftUI
import SwiftData

struct AddBudgetCategoryScreen: View {
    
    @Environment(\.showMessage) private var showMessage
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var errorMessage: String?
    
    private func saveBudgetCategory() {
        
        guard let amount = Decimal(string: amount) else { return }
        let budgetCategory = BudgetCategory(title: title, amount: amount)
        do {
            // context is passed to the model where the actual save is performed
            try budgetCategory.save(context: context)
            dismiss()
        } catch {
            showMessage(.error(error))
        }
    }
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace && !amount.isEmptyOrWhitespace && Decimal(string: amount) != nil
    }
    
    var body: some View {
        
        Form {
            TextField("Title", text: $title)
                .accessibilityIdentifier("titleTextField")
            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .accessibilityIdentifier("amountTextField")
            
            if let errorMessage {
                Text(errorMessage)
            }
        }
        .navigationTitle("Add Category")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveBudgetCategory()
                }.disabled(!isFormValid)
                    .accessibilityIdentifier("saveBudgetCategoryButton")
            }
        }
    }
}


