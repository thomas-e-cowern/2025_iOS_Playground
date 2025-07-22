//
//  StretchingHeader.swift
//  StretchyHeader
//
//  Created by Thomas Cowern on 7/22/25.
//

import SwiftUI

struct StretchingHeader<Content: View>: View {
    
    let content: () -> Content
    
    func height(for proxy: GeometryProxy) -> CGFloat {
        let y = proxy.frame(in: .global).minY
        return proxy.size.height + max(0, y)
    }
    
    func offset(for proxy: GeometryProxy) -> CGFloat {
        let y = proxy.frame(in: .global).minY
        return min(0, -y)
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(content: content)
                .frame(width: geo.size.width, height: height(for: geo))
                .offset(y: offset(for: geo))
        }
    }
}
