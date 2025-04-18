//
//  ClockAngles.swift
//  ClockRedesign
//
//  Created by Thomas Cowern on 4/18/25.
//

import SwiftUI

struct ClockAngles {
    var hour: Angle
    var minute: Angle
    var second: Angle
    
    init(for date: Date) {
        let components = Calendar.current.dateComponents([.hour, .minute, .second, .nanosecond], from: date)
        
        let hourComponent = components.hour ?? 0
        let minuteComponent = Double(components.minute ?? 0)
        let secondComponent = Double(components.second ?? 0)
        let nanosecondComponent = Double(components.nanosecond ?? 0)
        
        hour = .degrees(30 * (Double(hourComponent % 12) + minuteComponent / 60) + 180)
        
        minute = .degrees(6 * (minuteComponent + secondComponent / 60) + 180)
        
        second = .degrees(6 * (secondComponent + nanosecondComponent / 1_000_000_000) + 180)
    }
}
