//
//  Tip.swift
//  GroceryList
//
//  Created by Thomas Cowern on 2/7/25.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    var title: Text = Text("Essential Foods")
    var message: Text? = Text("Add some essential items to the shopping list.")
    var image: Image? = Image(systemName: "info.circle.")
}
