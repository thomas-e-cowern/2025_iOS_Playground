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
                    Text("\(budget.amount, format: .number)")
                }
                .padding()
            }
        }
        .onAppear() {
            do {
                try dataStore.loadBudgets()
            } catch {
                print("Error in onAppear: \(error.localizedDescription)")
            }
        }
    }
}

//struct ShortNumberFormat: FormatStyle {
//    let maxFractionLength: Int
//    func format(_ value: Double) -> String {
//        value.formatted(.number.precision(.fractionLength(0...maxFractionLength)))
//    }
//}
//
//extension FormatStyle where Self == ShortNumberFormat {
//    static func short(maxFractionLength: Int = 1) -> ShortNumberFormat {
//        .init(maxFractionLength: maxFractionLength)
//    }
//}
