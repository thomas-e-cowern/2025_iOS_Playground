//
//  ContentView.swift
//  ClockRedesign
//
//  Created by Thomas Cowern on 4/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TimelineView(.animation(minimumInterval: 1 / 20)) { timeline in
                Canvas { context, size in
                    let clock = ClockAngles(for: timeline.date)
                    
                    // Available space for clock
                    let drawRect = CGRect(origin: .zero, size: size)
                    let radius = min(size.width, size.height) / 2
                    
                    // Clock details
                    let borderThickness = radius / 25
                    let innerBlackRingSize = radius / 6
                    let centerSize = radius / 40
                    
                    // Hour hand
                    let hourHandLength = radius / 2.5
                    
                    // Minute hand
                    let minuteHandLength = radius / 1.5
                    
                    // Second hand
                    let secondHandLength = radius * 1.1
                    let secondHandWidth = radius / 25
                    
                    // Clock outer circle
                    context.stroke(Circle().inset(by: borderThickness / 2).path(in: drawRect), with: .color(.primary), lineWidth: borderThickness)
                    
                    // Centering clock hands
                    context.translateBy(x: drawRect.midX, y: drawRect.midY)
                    
                    // Draw the hands
                    drawHand(in: context, radius: radius, length: minuteHandLength, angle: clock.minute)
                    drawHand(in: context, radius: radius, length: hourHandLength, angle: clock.hour)
                    
                    // Draw the numbers
                    drawHours(in: context, radius: radius)
                    
                    // Center ring
                    let rect = CGRect(x: -innerBlackRingSize / 2, y: -innerBlackRingSize / 2, width: innerBlackRingSize, height: innerBlackRingSize)
                    context.stroke(Circle().path(in: rect), with: .color(.primary), lineWidth: centerSize)
                    
                    let centerPiece = Circle().path(in: rect.insetBy(dx: centerSize, dy: centerSize))
                    context.fill(centerPiece, with: .color(.white))
                    context.blendMode = .clear
                    context.fill(centerPiece, with: .color(.white))
                    context.blendMode = .normal
                    
                    // Second hand
                    let secondLine = Capsule().offset(x: 0, y: -radius / 6).rotation(clock.second, anchor: .top).path(in: CGRect(x: -secondHandWidth / 2, y: 0, width: secondHandWidth, height: secondHandLength))
                    
                    context.fill(secondLine, with: .color(.orange))
                    
                }
            }
//            .frame(width: 100, height: 100)
        }
        .padding()
    }
    
    // MARK: - Methods and functions
    func drawHand(in context: GraphicsContext, radius: Double, length: Double, angle: Angle) {
        let width = radius / 30

        let stalk = Rectangle().rotation(angle, anchor: .top).path(in: CGRect(x: -width / 2, y: 0, width: width, height: length))
    
        context.fill(stalk, with: .color(.primary))
        
        let hand = Capsule().offset(x: 0, y: radius / 5).rotation(angle, anchor: .top).path(in: CGRect(x: -width, y: 0, width: width * 2, height: length))
        
        context.fill(hand, with: .color(.primary))
    }
    
    func drawHours(in context: GraphicsContext, radius: Double) {
        let textSpace = CGSize(width: 200, height: 200)
        let textSize = radius / 4
        let textOffset = radius * 0.75
        
        // Adding the numbers
        for i in 1...12 {
            var contextCopy = context
            let text = Text(String(i)).font(.system(size: textSize)).bold()
            let resolvedText = contextCopy.resolve(text)
            
            // Center the text
            let textSize = resolvedText.measure(in: textSpace)
            contextCopy.translateBy(x: -textSize.width / 2, y: -textSize.height / 2)
            
            // Draw the numbers
            let point = CGPoint(x: 0, y: -textOffset).applying(CGAffineTransform(rotationAngle: Double(i) * .pi / 6))
            
            contextCopy.draw(resolvedText, in: CGRect(origin: point, size: textSpace))
        }
    }
}

#Preview("Light Mode") {
    ContentView()
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
