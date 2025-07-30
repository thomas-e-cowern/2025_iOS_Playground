//
//  Tip.swift
//  TipKitDemo
//
//  Created by Thomas Cowern on 7/30/25.
//

import Foundation
import TipKit

struct AddColorTip: Tip {
    
    var title: Text {
        Text("Add Color")
    }
    
    var description: Text {
        Text("Add color to your list.")
    }
    
    var image: Image? {
        Image(systemName: "paintpallete")
    }
    
}
