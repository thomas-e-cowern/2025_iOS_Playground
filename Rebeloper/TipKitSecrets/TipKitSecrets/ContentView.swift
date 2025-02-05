//
//  ContentView.swift
//  TipKitSecrets
//
//  Created by Thomas Cowern on 1/14/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    // Tips
//    private let imageTip: ImageTip = ImageTip()
//    private let textTip: TextTip = TextTip()
    
    
    private let tipGroup = TipGroup {
        TextTip()
        ImageTip()
    }
    
    private let countTip = CountTip()
    
    @State private var imageName = "globe"
    @State private var textValue = "Hello World"
    @State private var count = 0
    
    var body: some View {
        VStack {
            TipView(tipGroup.currentTip as? ImageTip, arrowEdge: .bottom) { actions in
                switch actions.id {
                case "change":
                    imageName = "dog"
                    tipGroup.currentTip?.invalidate(reason: .actionPerformed)
                case "close":
                    print("Closed")
                    tipGroup.currentTip?.invalidate(reason: .tipClosed)
                default:
                    break
                }
            }
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(textValue)
                .popoverTip(tipGroup.currentTip as? TextTip, arrowEdge: .top) { actions in
                    switch actions.id {
                    case "change":
                        textValue = "Hello TipKit"
                        tipGroup.currentTip?.invalidate(reason: .actionPerformed)
                    case "close":
                        print("Closed")
                        tipGroup.currentTip?.invalidate(reason: .tipClosed)
                    default:
                        break
                    }
                }
        }
        .padding()
        TipView(countTip)
        Button("\(count)") {
            count += 1
//            CountTip.isButtonTapped.toggle()
        }
        .buttonStyle(.borderedProminent)
        .font(.largeTitle)
        .bold()
    }
}

#Preview {
    ContentView()
}
