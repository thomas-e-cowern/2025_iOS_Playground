//
//  DataStore.swift
//  skip-budget
//
//  Created by Thomas Cowern on 2/18/25.
//

import Foundation
import SkipSQL
import Observation

@Observable
class DataStore {
    private let context: SQLContext
    
    var budgets: [Budget] = []
    
    init(context: SQLContext) {
        self.context = context
    }
    
    func saveBudget(budget: Budget) throws {
        let statement = try context.prepare(sql: "INSERT INTO Budgets(name, amount) VALUES (?, ?); ")
        defer {
            do {
                try statement.close()
            } catch {
                print("Error in saveBudget: \(error.localizedDescription)")
            }
        } // MARK: - End of defer
        
        try context.transaction {
            let params: [SQLValue] = [
                SQLValue.text(budget.name),
                SQLValue.float(budget.amount)
            ]
            
            try statement.update(parameters: params)
            
            var insertBudget = budget
            insertBudget.id = context.lastInsertRowID
            budgets.append(insertBudget)
        }
    }
    
    
}
