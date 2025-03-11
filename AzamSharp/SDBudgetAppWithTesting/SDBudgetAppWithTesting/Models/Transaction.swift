//
//  Transaction.swift
//  SDBudgetAppWithTesting
//
//  Created by Thomas Cowern on 3/11/25.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    var note: String
    var amount: Double
    var date: Date
    var hasReceipt: Bool
    var budget: Budget?
    
    init(note: String, amount: Double, date: Date, hasReceipt: Bool = false) {
        self.note = note
        self.amount = amount
        self.date = date
        self.hasReceipt = hasReceipt
    }
}
