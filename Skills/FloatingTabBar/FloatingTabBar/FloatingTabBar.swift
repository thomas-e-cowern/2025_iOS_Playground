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
    
    var body: some View {
        HStack {
            ForEach(Value.allCases, id: \.hashValue) { tab in
                let isActive = activeTab == tab
                
                Image(systemName: tab.symbolImage)
                    .font(.title3)
                    .foregroundStyle(isActive ? config.activeTint : config.inactiveTint)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                    .background {
                        if isActive {
                            Capsule()
                                .fill(config.activeBackgrounTint.gradient)
                        }
                    }
            }
        }
        .frame(height: 50)
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

protocol FloatingTabProtocol {
    var symbolImage: String { get }
}
