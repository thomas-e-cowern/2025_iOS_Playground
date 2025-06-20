//
//  HealthManager.swift
//  HealthKitPlayground
//
//  Created by Thomas Cowern on 6/20/25.
//

import Foundation
import HealthKit

@Observable
class HealthManager {
    
    let healthStore = HKHealthStore()
    
    init () {
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set<HKQuantityType> = [steps]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                print("Trying....")
            } catch {
                print("Error fetching health data in HealthManager: \(error.localizedDescription)")
            }
        }
    }
    
}
