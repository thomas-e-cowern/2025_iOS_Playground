//
//  ItemRow.swift
//  iDine
//
//  Created by Thomas Cowern on 12/19/25.
//

import SwiftUI

struct ItemRow: View {
    
    var item: MenuItem
    
    var body: some View {
        Text(item.name)
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}
