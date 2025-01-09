//
//  ContentView.swift
//  SwiftUITextFields
//
//  Created by Thomas Cowern on 1/9/25.
//

import SwiftUI

enum NumericTextInputMode {
    case number
    case decimal
}

struct NumericTextInputViewModifier: ViewModifier {
    
    @Binding var text: String
    let mode: NumericTextInputMode
    
    func body(content: Content) -> some View {
        content
            .keyboardType(mode == .number ? .numberPad : .decimalPad)
            .onChange(of: text) { _, newValue in
                let decimalSeparator = Locale.current.decimalSeparator ?? "."
                let numbers = "0123456789\(mode == .decimal ? decimalSeparator : "")"
                if newValue.components(separatedBy: decimalSeparator).count - 1 > 1 {
                    text = String(newValue.dropLast())
                } else {
                    let filtered = newValue.filter { numbers.contains($0) }
                    if filtered != newValue {
                        text = filtered
                    }
                }
            }
    }
}

extension View {
    func numericTextInput(_ mode: NumericTextInputMode = .number, text: Binding<String>) -> some View {
        modifier(NumericTextInputViewModifier(text: text, mode: mode))
    }
}

struct ContentView: View {
    
    @State private var intText = ""
    
    var body: some View {
        VStack {
            TextField("Int", text: $intText)
                .numericTextInput(.decimal, text: $intText)
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    ContentView()
}

