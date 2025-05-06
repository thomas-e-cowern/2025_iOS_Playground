//
//  ContentView.swift
//  NestedObservables
//
//  Created by Mohammad Azam on 4/8/24.
//

import SwiftUI
import Observation

struct Expense : Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var cost: Double
    var isDeletable: Bool
}

struct Expenses {
    
    var name: String
    var items: [Expense]

    init() {
        name = "John Smith"
        items = [
            Expense(name: "Lunch", type: "Business", cost: 25.47, isDeletable: true),
            Expense(name: "Taxi", type: "Business", cost: 17.0, isDeletable: true),
            Expense(name: "Sports Tickets", type: "Personal", cost: 75.0, isDeletable: false)
        ]
    }
    
}

@Observable
class ExpenseTracker {
    var name: String
    var expenses: Expenses
    
    init() {
        name = "My name"
        expenses = Expenses()
    }

}

struct ContentView: View {
    
    @State private var expenseTracker = ExpenseTracker()
    
    var body: some View {
        VStack {
            
            List(expenseTracker.expenses.items) { item in
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.name)
                            .font(.headline)
                        Spacer()
                        Text("$\(item.cost.formatted())")
                            .font(.headline)
                    }
                    Text(item.type)
                        .font(.caption)
                }
            }
            
            Button("Add Expense") {
                let expense = Expense(name: "Bread", type: "Groceries", cost: 4.50, isDeletable: false)
                expenseTracker.expenses.items.append(expense)
                print(expenseTracker.expenses.items.count)
            }
        }
    }
}

#Preview {
    ContentView()
}
