//
//  DebounceTextInput.swift
//  DebouncingSwiftUI
//
//  Created by Thomas Cowern on 4/15/25.
//

import SwiftUI

class DebouncedViewModel: ObservableObject {
    @Published var userInput: String = ""
}

struct DebouncedModifier: ViewModifier {
    
    @State private var viewModel = DebouncedViewModel()
    
    @Binding var text: String
    @Binding var debouncedText: String
    let debouncedSeconds: TimeInterval
    
    func body(content: Content) -> some View {
        content
            .onReceive(viewModel.$userInput.debounce(for: RunLoop.SchedulerTimeType.Stride(debouncedSeconds), scheduler: RunLoop.main)) { value in
                debouncedText = value
            }
            .onChange(of: text) { _, newValue in
                viewModel.userInput = newValue
            }
    }
}

extension View {
    public func debounced(text: Binding<String>, debouncedText: Binding<String>, debouncedSeconds: TimeInterval = 1) -> some View {
        modifier(DebouncedModifier(text: text, debouncedText: debouncedText, debouncedSeconds: debouncedSeconds))
    }
}
