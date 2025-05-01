//
//  ContentView.swift
//  CanvasPlayground
//
//  Created by Thomas Cowern on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                let size = 220
                
                let circle1 = Path(ellipseIn: CGRect(x: 100, y: 200, width: size, height: size))
                context.fill(circle1, with: .color(red: 1, green: 0, blue: 0))
                
            }
        }
    }
}

#Preview {
    ContentView()
}
