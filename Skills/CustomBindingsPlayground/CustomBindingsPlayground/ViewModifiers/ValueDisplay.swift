//
//  ValueDisplay.swift
//  CustomBindingsPlayground
//
//  Created by Thomas Cowern on 6/18/25.
//

import SwiftUI

struct ValueDisplay: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

extension Text {
    func valueDisplay() -> some View {
        modifier(ValueDisplay())
    }
}
