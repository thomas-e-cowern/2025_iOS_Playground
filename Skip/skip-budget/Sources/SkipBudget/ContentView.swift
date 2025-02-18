import SwiftUI
import SkipSQL

public enum ContentTab: String, Hashable {
    case welcome, home, settings
}

public struct ContentView: View {
    
    @Environment(DataStore.self) private var dataStore
    
    @State private var name: String = ""
    @State private var amount: String = ""
    
    public var body: some View {
        Form {
            TextField("Enter Name", text: $name)
            TextField("Enter Amount", text: $amount)
            Button("Save") {
                // MARK: TODO - Save budget item
                let budget = Budget(name: name, amount: Double(amount) ?? 0.0)
                do {
                    try dataStore.saveBudget(budget: budget)
                } catch {
                    print("Error saving budget in ContentView: \(error.localizedDescription)")
                }
                
            }
            
            ForEach(dataStore.budgets) { budget in
                HStack {
                    Text(budget.name)
                    Spacer()
                    Text("\(budget.amount)")
                }
                .padding()
            }
        }
    }
}
