//
//  FloatingTabBar.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/3/25.
//

import SwiftUI

fileprivate struct FloatingTabBar: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct FloatingTabConfig {
    var activeTint: Color = .white
    var activeBackgrounTint: Color = .blue
    var inactiveTint: Color = .gray
    var tabAnimation: Animation = .smooth(duration: 0.35, extraBounce: 0)
    var backgroundColor: Color = .gray.opacity(0.1)
    var insetAmount: CGFloat = 6
    var isTranslucent: Bool = true
}
