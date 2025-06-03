//
//  FloatingTabView.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/3/25.
//
import SwiftUI

struct FloatingTabView<Content: View, Value: CaseIterable>: View where Value: Hashable & RandomAccessCollection {
    @Binding var selection: Value
    var content: (Value, CGFloat) -> Content
    
    init(selection: Binding<Value>, @ViewBuilder content: @escaping (Value, CGFloat) -> Content) {
        self._selection = selection
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if #available(iOS 18, *) {
                // New tab view
            } else {
                // Old tab view
            }
        }
    }
}
