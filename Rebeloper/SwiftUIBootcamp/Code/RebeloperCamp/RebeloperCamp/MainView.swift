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
    
    @State private var scrollPostition = ScrollPosition()
    
    var body: some View {
        
        List {
            ForEach(colors) { colorItem in
                Text(colorItem.color.description)
                    .foregroundStyle(colorItem.color)
            }
        }
        
//        VStack {
//            VStack {
//                Button("Scroll To") {
//                    scrollPostition.scrollTo(id: Color.orange, anchor: .center)
//                }
//            }
//            GeometryReader { proxy in
//                //                ScrollViewReader { readerProxy in
//                ScrollView(.horizontal) {
//                    LazyHGrid(rows: gridItems, alignment: .center, spacing: 20, pinnedViews: [.sectionFooters, .sectionHeaders]) {
//                        //                Section {
//                        ForEach(colors) { colorItem in
//                            cell(colorItem, proxy: proxy)
//                                .id(colorItem.color)
//                                .onScrollVisibilityChange(threshold: 0.1) { visible in
//                                    print("Color \(colorItem.color.description) is \(visible)")
//                                }
//                        }
//                        //                } header: {
//                        //                    Text("This is the header")
//                        //                } footer: {
//                        //                    Text("This is the footer")
//                        //                }
//                    }
//                }
//                .scrollIndicators(.hidden)
//                .scrollPosition($scrollPostition)
//                .onScrollPhaseChange { oldPhase, newPhase, context in
//                    print("OP: \(oldPhase)")
//                    print("NP: \(newPhase)")
//                    print("CT: \(context.geometry.contentOffset.x)")
//                }
//                //                }
//            }
//        }
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
