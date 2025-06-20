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
    
    var activities: [String : Activity] = [:]
    
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
    
    func fetchSteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: Date.startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("Error fetching todays steps....")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            let activity = Activity(id: 0, title: "Today's Steps", subtitle: "Goal: 10,000", imageName: "figure.walk", amount: stepCount.formattedToString())
            
            DispatchQueue.main.async {
                self.activities["Today's Steps"] = activity
            }
        }
        healthStore.execute(query)
    }
    
}

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}

extension Double {
    func formattedToString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
