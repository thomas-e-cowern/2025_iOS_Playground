//
//  Budget.swift
//  SDBudgetAppWithTesting
//
//  Created by Thomas Cowern on 3/10/25.
//

import Foundation
import SwiftData

@Model
final class Budget {
    var name: String
    var limit: Double
    
    @Relationship(deleteRule: .cascade)
    var transactions: [Transaction] = []
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
    
    func addTransaction(_ transaction: Transaction) {
        
        self.transactions.append(transaction)
    }
}


