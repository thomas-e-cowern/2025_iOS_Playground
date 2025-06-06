//
//  Extensions+View.swift
//  SizeChangeDemo
//
//  Created by Thomas Cowern on 4/23/25.
//

import SwiftUI

extension View {
    func readsize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader(content: { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            })
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {  }
}
