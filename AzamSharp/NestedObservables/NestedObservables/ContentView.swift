//
//  ContentView.swift
//  NestedObservables
//
//  Created by Mohammad Azam on 4/8/24.
//

import SwiftUI
import Observation

enum ExpenseTypes: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case Grocery = "Grocery"
    case Personal = "Personal"
    case Business = "Business"
    case Entertainment = "Entertainment"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

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
    @State private var name: String = ""
    @State private var type: ExpenseTypes = .Grocery
    @State private var cost: Double = 0.0
    
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
            HStack {
                
                TextField("Name", text: $name)
                Spacer()
                Picker("Types", selection: $type) {
                    ForEach(ExpenseTypes.allCases) { type in
                        Text(type.localizedName)
                    }
                }
                Spacer()
                TextField("Cost", value: $cost, formatter: NumberFormatter())
                
            }
            .padding()
            
            Button("Add Expense") {
                let expense = Expense(name: name, type: type.rawValue, cost: cost, isDeletable: false)
                expenseTracker.expenses.items.append(expense)
                print(expenseTracker.expenses.items.count)
                clearFields()
            }
            
        }
    }
    
    func clearFields() {
        self.name = ""
        self.type = .Grocery
        self.cost = 0
    }
}

#Preview {
    ContentView()
}
