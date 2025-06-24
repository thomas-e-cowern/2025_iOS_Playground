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
    
    var mockActivities: [String : Activity] = [
        "todaySteps" : Activity(id: 0, title: "Today's Steps", subtitle: "Goal: 10,000", imageName: "figure.walk", amount: "6,392"),
        "todayCalories" : Activity(id: 1, title: "Today's Calories", subtitle: "Goal: 2,000", imageName: "hand.thumbsup.fill", amount: "1,234")
    ]
    
    init () {
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        let workout = HKObjectType.workoutType()
        let weight = HKQuantityType(.bodyMass)
        
        let healthTypes: Set = [steps, calories, workout, weight]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                print("Trying....")
                fetchSteps()
                fetchCalories()
                fetchWeeklyRunStats()
                fetchWeight()
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
    
    func fetchWeeklyRunStats() {
        let workout = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: Date.startOfWeek, end: Date())
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: 25, sortDescriptors: nil) { _, results, error in
            guard let workouts = results as? [HKWorkout], error == nil else {
                print("Error getting weekly run stats")
                return
            }
            
            var count: Int = 0
            for workout in workouts {
                let duration = Int(workout.duration)/60
                count += duration
            }
            
            
            let activity = Activity(id: 1, title: "Walking", subtitle: "This week", imageName: "figure.walk", amount: "\(count) minutes")
            
            DispatchQueue.main.async {
                self.activities["Walking"] = activity
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
    
    func fetchWeight() {
        let weight = HKQuantityType(.bodyMass)
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: nil)
        let query = HKStatisticsQuery(quantityType: weight, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result, error == nil else {
                print("Error fetching weight....")
                return
            }
            
            
            
        }
        healthStore.execute(query)
    }
    
}

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    static var startOfWeek: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 1 
        return calendar.date(from: components)!
    }
    
    static var startOfMonth: Date {
        let calendar = Calendar.current
        var components = Calendar.current.dateComponents([.year, .month], from: Date())
        components.day = 1
        return calendar.date(from: components)!
    }
    
    static var startOfYear: Date {
        let calendar = Calendar.current
        var components = Calendar.current.dateComponents([.year], from: Date())
        components.month = 1
        components.day = 1
        return calendar.date(from: components)!
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
