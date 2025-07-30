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
    
    var message: Text? {
        Text("Add a color to your list.")
    }
    
    var image: Image? {
        Image(systemName: "paintpalette.fill")
    }
    
}

struct SetFavoriteTip: Tip {
    
    static let setFavoriteEvent = Event(id: "setFavoriteEvent")
    static let colorsViewVisitedEvent = Event(id: "colorsViewVisitedEvent")
    
    var title: Text {
        Text("Set Favorites")
    }
    
    var message: Text? {
        Text("Tap and hold a color to add it to your favorites list.")
    }
    
    var image: Image? {
        Image(systemName: "hand.point.up.left.fill")
    }
    
    var rules: [Rule] {
        #Rule(SetFavoriteTip.setFavoriteEvent) { event in
            event.donations.count == 0
        }
        
        #Rule(SetFavoriteTip.colorsViewVisitedEvent) { event in
            event.donations.count > 3
        }
    }
}
