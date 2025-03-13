//
//  BudgetCategory.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//

import Foundation
import SwiftData

enum BudgetCategoryError: LocalizedError {
    case titleAlreadyExists
    
    var errorDescription: String? {
        switch self {
        case .titleAlreadyExists:
            return "A budget category with this title already exists."
        }
    }
}

@Model
class BudgetCategory {
    @Attribute(.unique) var title: String = ""
    var amoung: Decimal = 0.0
    @Relationship(deleteRule: .cascade) var transactions: [Transaction] = []
    
    init(title: String, amoung: Decimal) {
        self.title = title
        self.amoung = amoung
    }
    
    var total: Decimal {
        
    }
}
