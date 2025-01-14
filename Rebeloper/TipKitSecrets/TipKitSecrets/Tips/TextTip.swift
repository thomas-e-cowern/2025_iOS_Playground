//
//  TextTip.swift
//  TipKitSecrets
//
//  Created by Thomas Cowern on 1/14/25.
//

import TipKit

struct TextTip: Tip {
    var title: Text {
        Text("This is a text view")
    }
    
    var message: Text? {
        Text("You can change it to greet TipKit")
    }
    
    var image: Image? { Image(systemName: "textformat.alt") }
    
    var actions: [Action] { [
        Action(id: "change", title: "Change to get TipKit"),
        Action(id: "close", title: "Close")
    ] }
}
