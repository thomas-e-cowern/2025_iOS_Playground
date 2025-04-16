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
