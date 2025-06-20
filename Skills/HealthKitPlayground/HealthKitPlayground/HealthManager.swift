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
        let calories = HKQuantityType(.activeEnergyBurned)
        
        let healthTypes: Set<HKQuantityType> = [steps, calories]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                print("Trying....")
                fetchSteps()
                fetchCalories()
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
    
    func fetchCalories() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: Date.startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("Error fetching todays calories....")
                return
            }
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            print("Calorie count; \(calorieCount)")
            let activity = Activity(id: 1, title: "Today's Calories", subtitle: "Goal: 2,000", imageName: "hand.thumbsup.fill", amount: calorieCount.formattedToString())
            
            DispatchQueue.main.async {
                self.activities["Today's Calories"] = activity
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
