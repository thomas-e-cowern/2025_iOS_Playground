//
//  inlinePopverTip.swift
//  TipKitDemoMap
//
//  Created by Thomas Cowern on 7/31/25.
//

import SwiftUI
import TipKit

struct inlinePopverTip: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct InlinePopoverTipView: Tip {
    var title: Text {
        Text("Bonfire Madness")
    }
    
    var message: Text? {
        Text("Bring a fire extinguisher")
    }
    
    var image: Image? {
        Image("inline.tip.image")
    }
    
    var actions: [Action] {
        [
            Tip.Action(
                id: "action",
                title: "Learn More",
                perform: executeAction
            )
        ]
    }
    
    @Sendable
    func executeAction() {
        print("Executed....")
    }
}

#Preview {
    inlinePopverTip()
        .task {
            try? Tips.resetDatastore()
            
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}
