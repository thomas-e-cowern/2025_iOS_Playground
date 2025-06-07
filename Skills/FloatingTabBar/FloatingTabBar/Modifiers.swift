//
//  Modifiers.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/4/25.
//
import SwiftUI

struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(.rect)
    }
}
