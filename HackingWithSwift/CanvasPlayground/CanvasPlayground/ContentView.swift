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
                context.opacity = 0.5
                
                let circle1 = Path(ellipseIn: CGRect(x: 100, y: 200, width: size, height: size))
                context.fill(circle1, with: .color(red: 1, green: 0, blue: 0))
                
                let circle2 = Path(ellipseIn: CGRect(x: 100, y: 300, width: size, height: size))
                context.fill(circle2, with: .color(red: 0, green: 1, blue: 0))
                
                let circle3 = Path(ellipseIn: CGRect(x: 100, y: 400, width: size, height: size))
                context.fill(circle3, with: .color(red: 0, green: 0, blue: 1))
                
            }
        }
    }
}

#Preview {
    ContentView()
}
