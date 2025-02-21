//
//  Date+Extensions.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/21/25.
//
import Foundation

extension Date {
    
    func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days,to: self) ?? self
    }
    
}
