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
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: [GridItem(spacing: nil), GridItem(spacing: nil), GridItem(spacing: nil)], alignment: .center, spacing: 20, pinnedViews: [.sectionFooters, .sectionHeaders]) {
                    //                Section {
                    ForEach(colors) { colorItem in
                        cell(colorItem, proxy: proxy)
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
    
    func cell(_ colorItem: ColorItem, proxy: GeometryProxy) -> some View {
        ZStack {
            colorItem.color
                .padding(20)
                .frame(height: proxy.size.width / 3)
            Text(colorItem.color.description)
                .foregroundStyle(Color.white)
        }
        
    }
}

#Preview {
    MainView()
}
