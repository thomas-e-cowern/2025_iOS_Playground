//
//  HarvestCountdownView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/21/25.
//

import SwiftUI

struct HarvestCountdownView: View {
    
    let plantingDate: Date
    let harvestDays: Int
    
    private var daysElapsed: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: plantingDate, to: Date())
        return components.day ?? 0
    }
    
    private var daysRemaining: Int {
        max(harvestDays - daysElapsed, 0)
    }
    
    private var progress: CGFloat {
        CGFloat(daysElapsed) / CGFloat(harvestDays)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.green.opacity(0.3),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
        }
    }
}

#Preview("Light View") {
    HarvestCountdownView(plantingDate: Date(), harvestDays: 90)
        .preferredColorScheme(.light)
}

#Preview("Dark View") {
    HarvestCountdownView(plantingDate: Date(), harvestDays: 90)
        .preferredColorScheme(.dark)
}

