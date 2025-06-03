//
//  FloatingTabView.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/3/25.
//
import SwiftUI

struct FloatingTabView<Content: View, Value: CaseIterable & Hashable>: View where Value.AllCases: RandomAccessCollection {
    @Binding var selection: Value
    var config: FloatingTabConfig
    var content: (Value, CGFloat) -> Content
    
    init(selection: Binding<Value>, config: FloatingTabConfig = .init(), @ViewBuilder content: @escaping (Value, CGFloat) -> Content) {
        self._selection = selection
        self.config = config
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if #available(iOS 18, *) {
                // New tab view
                TabView(selection: $selection) {
                    ForEach(Value.allCases, id: \.hashValue) { tab in
                        Tab.init(value: tab) {
                            content(tab, 0)
                                // Hide default toolbar
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
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
            
            FloatingTabBar(activeTab: $selection, config: config)
            
        }
    }
}
