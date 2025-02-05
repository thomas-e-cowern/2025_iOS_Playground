//
//  DemoTip.swift
//  TipKitSecrets
//
//  Created by Thomas Cowern on 2/5/25.
//

import SwiftUI
import TipKit

struct DemoTip: Tip {
    var title: Text = .init("Hello World")

    @Parameter
    static var show: Bool = false

    var rules: [Rule] {
        #Rule(Self.$show) {
            $0
        }
    }
}
