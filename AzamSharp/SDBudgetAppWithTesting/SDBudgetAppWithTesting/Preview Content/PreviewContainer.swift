//
//  PreviewContainer.swift
//  SDBudgetAppWithTesting
//
//  Created by Thomas Cowern on 3/12/25.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Budget.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        SampleData.budgets.enumerated().forEach { index, budget in
            container.mainContext.insert(budget)
            let transaction = Transaction(note: "Note \(index + 1)", amount: (Double(index)), date: Date(), hasReceipt: Bool.random())
            transaction.budget = budget
            budget.transactions.append(transaction)
        }
        
        return container
        
    } catch {
        fatalError("Failed to create container: \(error)")
    }
}()

struct SampleData {
    static let budgets: [Budget] = {
        return (1...10).map { Budget(name: "Budget \($0)", limit: 100 * Double($0)) }
    }()
}
