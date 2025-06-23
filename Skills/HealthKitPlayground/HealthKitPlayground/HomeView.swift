//
//  HomeView.swift
//  HealthKitPlayground
//
//  Created by Thomas Cowern on 6/20/25.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(HealthManager.self) var healthManager
    
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.title.bold())
                .padding()
                .foregroundStyle(.secondary)
            
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                ForEach(healthManager.mockActivities.sorted(by: { $0.value.id < $1.value.id }), id: \.key) { activity in
                    ActivityCard(activity: activity.value)
                }
            }
        }
        .padding(.horizontal, 2)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    HomeView()
        .environment(HealthManager())
}
