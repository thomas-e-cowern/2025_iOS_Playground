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
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    ContentView()
}

