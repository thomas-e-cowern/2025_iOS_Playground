//
//  MainView.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/29/25.
//

import SwiftUI

struct MainView: View {
    
    @ScaledMetric var spacingSize: CGFloat = 10
    
    @State private var colors: [ColorItem] = [
        .init(color: .red),
        .init(color: .blue),
        .init(color: .green),
        .init(color: .yellow),
        .init(color: .purple),
        .init(color: .orange),
        .init(color: .pink),
        .init(color: .brown),
        .init(color: .black)
    ]
    
    @State private var gridItems = [GridItem(spacing: nil), GridItem(spacing: nil), GridItem(spacing: nil)]
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ScrollViewReader { readerProxy in
                    Button("Scroll To") {
                        readerProxy.scrollTo(Color.orange, anchor: .center)
                    }
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: gridItems, alignment: .center, spacing: 20, pinnedViews: [.sectionFooters, .sectionHeaders]) {
                            //                Section {
                            ForEach(colors) { colorItem in
                                cell(colorItem, proxy: proxy)
                                    .id(colorItem.color)
                            }
                            //                } header: {
                            //                    Text("This is the header")
                            //                } footer: {
                            //                    Text("This is the footer")
                            //                }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
    
    func cell(_ colorItem: ColorItem, proxy: GeometryProxy) -> some View {
        ZStack {
            colorItem.color
                .padding(20)
                .frame(width: proxy.size.height / CGFloat(gridItems.count))
            Text(colorItem.color.description)
                .foregroundStyle(Color.white)
        }
        
    }
}

#Preview {
    MainView()
}
