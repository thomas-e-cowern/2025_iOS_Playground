//
//  BudgetDetailScreen.swift
//  SDBudgetAppWithTesting
//
//  Created by Thomas Cowern on 3/11/25.
//

import SwiftUI
import SwiftData

struct BudgetDetailScreen: View {
    
    let budget: Budget
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BudgetDetailScreen(budget: Budget(name: "Europe Trip", limit: 5700))
}
