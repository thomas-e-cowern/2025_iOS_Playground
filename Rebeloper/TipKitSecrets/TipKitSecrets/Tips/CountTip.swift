//
//  CountTip.swift
//  TipKitSecrets
//
//  Created by Thomas Cowern on 2/4/25.
//

import SwiftUI
import TipKit

struct CountTip: Tip {
    var title: Text {
        Text("Tap the button to count up")
    }
    
    var message: Text? {
        Text("The text will change when you tap it.")
    }
    
    var image: Image? {
        Image(systemName: "hand.tap.fill")
    }
    
    @Parameter
    static var isButtonTapped: Bool = false
    
    static let didTriggerButtonEvent = Event(id: "didTriggerButtonEvent")
    
    var rules: [Rule] {
        [
            #Rule(Self.$isButtonTapped) {
                $0
            }
//            #Rule(Self.didTriggerButtonEvent) {
//                $0.donations.count > 5
//            }
        ]
    }
}
