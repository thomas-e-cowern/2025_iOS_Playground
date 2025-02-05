//
//  TipStatusView.swift
//  TipKitSecrets
//
//  Created by Thomas Cowern on 2/5/25.
//

import SwiftUI

struct TipStatusView: View {
    let tip = DemoTip()
    var body: some View {
        List {
            Button("Show Toggle") {
                DemoTip.show.toggle()
            }
            Button("Invalidate") {
                tip.invalidate(reason: .actionPerformed)
            }
        }
        .task {
            for await status in tip.statusUpdates {
                print("Status:", status)
            }
        }
        .task {
            for await shouldDisplay in tip.shouldDisplayUpdates {
                print("Display:", shouldDisplay)
            }
        }
    }
}


#Preview {
    TipStatusView()
}
