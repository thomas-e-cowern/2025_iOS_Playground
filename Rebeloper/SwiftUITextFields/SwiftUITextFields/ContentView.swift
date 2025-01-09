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

struct NumericTextField<Value: Numeric>: View {
    
    let title: String
    let mode: NumericTextInputMode
    @Binding var value: Value
    
    
    init(title: String, mode: NumericTextInputMode = .number, value: Binding<Value>) {
        self.title = title
        self.mode = mode
        self._value = value
    }
    
    @State private var text: String = ""
    
    var body: some View {
        TextField(title, text: $text)
            .numericTextInput(mode, text: $text)
            .onChange(of: text) { _, newValue in
                guard let numericValue = newValue as? Value else { return }
                value = numericValue
            }
    }
}

struct ContentView: View {
    
    @State private var intText = ""
    @State private var doubleValue: Double = 0.0
    
    var body: some View {
        VStack {
            TextField("Int", text: $intText)
                .numericTextInput(.decimal, text: $intText)
            Spacer()
                .frame(height: 20)
            NumericTextField(title: "Double", mode: .decimal, value: $doubleValue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

