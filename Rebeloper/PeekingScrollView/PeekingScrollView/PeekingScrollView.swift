//
//  PeekingScrollView.swift
//  PeekingScrollView
//
//  Created by Thomas Cowern on 1/7/25.
//

import SwiftUI

struct PeekingScrollView<Item, Cell: View>: View {
    
    private let items: [Item]
    private let contentMargins: CGFloat
    private let spacing: CGFloat
    @ViewBuilder private let cell: (Int, Item) -> Cell
    
    @State private var height: CGFloat = 1
    
    init(
        _ items: [Item],
        contentMargins: CGFloat? = nil,
        spacing: CGFloat? = nil,
        @ViewBuilder cell: @escaping (Int, Item) -> Cell) {
        self.items = items
        self.contentMargins = contentMargins ?? 10
        self.spacing = spacing ?? 10
        self.cell = cell
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(Array(zip(items.indices, items)), id: \.0) { index, item in
                       cell(index, item)
                            .padding(spacing / 2)
                    }
                    .readSize { size in
                        self.height = max(size.height, self.height)
                        print(height)
                    }
                    .frame(width: geometry.size.width > (contentMargins * 2) ? geometry.size.width - (contentMargins * 2) : 0)
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal, contentMargins)
        }
        .frame(height: height)
    }
}
