//
//  ImageTip.swift
//  TipKitSecrets
//
//  Created by Thomas Cowern on 1/14/25.
//

import Foundation
import TipKit

struct ImageTip: Tip {
    var title: Text { Text("This is an image view") }
    var message: Text? { Text("You can change it to a dog") }
    var image: Image? { Image(systemName: "dog") }
    var actions: [Action] { [
        Action(id: "change", title: "Change to dog"),
        Action(id: "close", title: "Close")
    ] }
}
