//
//  DateManager.swift
//  ToDoList
//
//  Created by Thomas Cowern on 10/30/25.
//

import Foundation
import Observation

@Observable
class DateManager {
    
    var weeks: [WeekModel] = []
    var selectedDate: Date
    
    init(with date: Date = Date()) {
        self.selectedDate = Calendar.current.startOfDay(for: date)
    }
}
