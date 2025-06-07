//
//  FloatingTabView.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/3/25.
//
import SwiftUI

struct FloatingTabView<Content: View, Value: CaseIterable & Hashable & FloatingTabProtocol>: View where Value.AllCases: RandomAccessCollection {
    @Binding var selection: Value
    var config: FloatingTabConfig
    var content: (Value, CGFloat) -> Content
    
    init(selection: Binding<Value>, config: FloatingTabConfig = .init(), @ViewBuilder content: @escaping (Value, CGFloat) -> Content) {
        self._selection = selection
        self.config = config
        self.content = content
    }
    
    var body: some View {
        
        @StateObject var helper: FloatingTabViewHelper = .init()
        @State var tabBarSize: CGSize = .zero
        
        ZStack(alignment: .bottom) {
            if #available(iOS 18, *) {
                // New tab view
                TabView(selection: $selection) {
                    ForEach(Value.allCases, id: \.hashValue) { tab in
                        Tab.init(value: tab) {
                            content(tab, tabBarSize.height)
                            // Hide default toolbar
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                    }
                }
            } else {
                // Old tab view
                TabView(selection: $selection) {
                    ForEach(Value.allCases, id: \.hashValue) { tab in
                        content(tab, tabBarSize.height)
                        // Old type tab bar
                            .tag(tab)
                        // Hide default toolbar
                            .toolbar(.hidden, for: .tabBar)
                    }
                }
            }
            
            
            
            FloatingTabBar(activeTab: $selection, config: config)
                .padding(.horizontal, config.hPadding)
                .padding(.vertical, config.bPadding)
                .onGeometryChange(for: CGSize.self) {
                    $0.size
                } action: { newValue in
                    tabBarSize = newValue
                }
                .offset(y: helper.hideTabBar ? (tabBarSize.height + 100) : 0)
                .animation(config.tabAnimation, value: helper.hideTabBar)
            
            
        }
        .environmentObject(helper)
    }
}

class FloatingTabViewHelper: ObservableObject {
    @Published var hideTabBar: Bool = false
}

struct HideFloatingTabBarModifier: ViewModifier {
    var status: Bool
    @EnvironmentObject private var helper: FloatingTabViewHelper
    
    func body(content: Content) -> some View {
        content
            .onChange(of: status, initial: true) { oldValue, newValue in
                helper.hideTabBar = newValue
            }
    }
}

extension View {
    func hideFloatingTabBar(_ status: Bool) -> some View {
        self
            .modifier(HideFloatingTabBarModifier(status: status))
    }
}
