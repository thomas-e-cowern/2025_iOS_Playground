//
//  CapsuleDetailView.swift
//  SpaceXTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import SwiftUI

struct CapsuleDetailView: View {
    
    var capsule: Capsule
    
    var body: some View {
        Form {
            Section("Basic Info") {
                Text("Serial #: \(capsule.serial)")
                Text("Type: \(capsule.type)")
                Text("Status: \(capsule.status)")
            }
            
            Section("Landings") {
                Text("Land: \(capsule.landLandings)")
                Text("Water: \(capsule.waterLandings)")
            }
            
            Section("Launches") {
                ForEach(capsule.launches, id: \.self) { launch in
                    Text(launch)
                }
            }
            
            Section("Current Info") {
                if let update = capsule.lastUpdate {
                    Text(update)
                } else {
                    Text("N/A")
                }
            }
        }
        .navigationTitle("Capsule Detail")
    }
}

#Preview {
    NavigationStack {
        CapsuleDetailView(capsule: DataViewModel().capsules.first!)
    }
}
