//
//  FloatingTabBar.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/3/25.
//

import SwiftUI

struct FloatingTabBar<Value: CaseIterable & Hashable & FloatingTabProtocol>: View where Value.AllCases: RandomAccessCollection {
    
    @Binding var activeTab: Value
    var config: FloatingTabConfig
    
    // For tab sliding effect
    @Namespace private var animation
    
    // For symbol effect
    @State private var toggleSymbolEffect: [Bool] = Array(repeating: false, count: Value.allCases.count)
    
    var body: some View {
        HStack {
            ForEach(Value.allCases, id: \.hashValue) { tab in
                let isActive = activeTab == tab
                let index = (Value.allCases.firstIndex(of: tab) as? Int) ?? 0
                
                Image(systemName: tab.symbolImage)
                    .foregroundStyle(isActive ? config.activeTint : config.inactiveTint)
                    .symbolEffect(.bounce.byLayer.down, value: toggleSymbolEffect[index])
                    .modifier(ImageModifier())
                    .background {
                        if isActive {
                            Capsule(style: .continuous)
                                .fill(config.activeBackgrounTint.gradient)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .onTapGesture {
                        activeTab = tab
                        toggleSymbolEffect[index].toggle()
                    }
                    .padding(.vertical, config.insetAmount)
            }
        }
        .padding(.horizontal, config.insetAmount)
        .frame(height: 50)
        .background {
            ZStack {
                if config.isTranslucent {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                } else {
                    Rectangle()
                        .fill(.background)
                }
                
                Rectangle()
                    .fill(config.backgroundColor)
            }
        }
        .clipShape(.capsule(style: .continuous))
        .animation(config.tabAnimation, value: activeTab)
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
    var hPadding: CGFloat = 15
    var bPadding: CGFloat = 5
}

protocol FloatingTabProtocol {
    var symbolImage: String { get }
}
