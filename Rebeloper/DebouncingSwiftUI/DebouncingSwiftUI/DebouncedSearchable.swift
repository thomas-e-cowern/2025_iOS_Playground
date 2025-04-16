//
//  DebouncedSearchable.swift
//  DebouncingSwiftUI
//
//  Created by Thomas Cowern on 4/16/25.
//

import SwiftUI

struct DebouncedSearchable: ViewModifier {
    
    @State private var text: String = ""
    @Binding var debouncedText: String
    let debouncedSeconds: TimeInterval
    
    func body(content: Content) -> some View {
        content
            .searchable(text: $text)
            .debounced(text: $text, debouncedText: $debouncedText, debouncedSeconds: debouncedSeconds)
    }
}

extension View {
    func searchable(debouncedText: Binding<String>, debouncedSeconds: TimeInterval = 0.5) -> some View {
        modifier(DebouncedSearchable(debouncedText: debouncedText, debouncedSeconds: debouncedSeconds))
    }
}

struct OnDebouncedSearchable: ViewModifier {
    
    @State private var text: String = ""
    @State var debouncedText: String = ""
    let debouncedSeconds: TimeInterval
    
    let onDebounced: (String) -> Void
    
    
    
    func body(content: Content) -> some View {
        content
            .searchable(text: $text)
            .debounced(text: $text, debouncedText: $debouncedText, debouncedSeconds: debouncedSeconds)
            .onChange(of: debouncedText) { _, newValue in
                onDebounced(newValue)
            }
    }
}

extension View {
    func searchable(debouncedText: Binding<String>, debouncedSeconds: TimeInterval = 0.5, onDebounced: @escaping (String) -> Void) -> some View {
        modifier(OnDebouncedSearchable(debouncedSeconds: debouncedSeconds, onDebounced: onDebounced))
    }
}
