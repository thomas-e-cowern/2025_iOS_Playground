//
//  ItemDetail.swift
//  iDine
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

struct ItemDetail: View {
    
    var item: MenuItem
    
    @Environment(Order.self) private var order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo by \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button {
                order.add(item: item)
            } label: {
                Text("Add To Order")
            }

            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environment(Order())
    }
}
