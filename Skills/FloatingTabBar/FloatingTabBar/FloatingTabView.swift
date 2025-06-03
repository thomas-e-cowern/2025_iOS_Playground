//
//  FloatingTabView.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/3/25.
//
import SwiftUI

struct FloatingTabView<Content: View, Value: CaseIterable & Hashable>: View where Value.AllCases: RandomAccessCollection {
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
                TabView(selection: $selection) {
                    ForEach(Value.allCases, id: \.hashValue) { tab in
                        content(tab, 0)
                            // Hide default toolbar
                            .toolbarVisibility(.hidden, for: .tabBar)
                    }
                }
            } else {
                // Old tab view
                TabView(selection: $selection) {
                    ForEach(Value.allCases, id: \.hashValue) { tab in
                        content(tab, 0)
                            // Old type tab bar
                            .tag(tab)
                            // Hide default toolbar
                            .toolbar(.hidden, for: .tabBar)
                    }
                }
            }
        }
    }
}
