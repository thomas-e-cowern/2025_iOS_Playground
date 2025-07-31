//
//  PopoverTip.swift
//  TipKitDemoMap
//
//  Created by Thomas Cowern on 7/31/25.
//

import Foundation
import TipKit

struct PopoverTip: View {
    
    private let popoverTip = PopoverTipView()
    
    var body: some View {
        Text("PopoverTip")
            .popoverTip(popoverTip)
    }
}


#Preview {
    PopoverTip()
        .task {
            try? Tips.resetDatastore()
            
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
}

struct PopoverTipView: Tip {
    var title: Text {
        Text("Halloween Events")
    }
    
    var message: Text? {
        Text("All Halloween events nearby")
    }
    
    var image: Image? {
        Image("Info.tip.image")
    }
}
