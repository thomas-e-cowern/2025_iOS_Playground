//
//  ItemDetail.swift
//  iDine
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

struct ItemDetail: View {
    
    var item: MenuItem
    
    var body: some View {
        VStack {
            Image(item.mainImage)
            Text(item.name)
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    ItemDetail(item: MenuItem.example)
}
