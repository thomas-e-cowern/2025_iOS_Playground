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
    private let imageTip: ImageTip = ImageTip()
    private let textTip: TextTip = TextTip()
    
    @State private var imageName = "globe"
    @State private var textValue = "Hello World"
    @State private var count = 0
    
    var body: some View {
        VStack {
            TipView(imageTip, arrowEdge: .bottom) { actions in
                switch actions.id {
                case "change":
                    imageName = "dog"
                    imageTip.invalidate(reason: .actionPerformed)
                case "close":
                    print("Closed")
                    imageTip.invalidate(reason: .tipClosed)
                default:
                    break
                }
            }
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(textValue)
                .popoverTip(textTip, arrowEdge: .top) { actions in
                    switch actions.id {
                    case "change":
                        textValue = "Hello TipKit"
                        textTip.invalidate(reason: .actionPerformed)
                    case "close":
                        print("Closed")
                        textTip.invalidate(reason: .tipClosed)
                    default:
                        break
                    }
                }
        }
        .padding()
        
        Button("\(count)") {
            count += 1
        }
        .buttonStyle(.borderedProminent)
        .font(.largeTitle)
        .bold()
    }
}

#Preview {
    ContentView()
}
