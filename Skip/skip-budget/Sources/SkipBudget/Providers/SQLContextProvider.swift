//
//  File.swift
//  skip-budget
//
//  Created by Thomas Cowern on 2/18/25.
//

import Foundation
import SkipSQL

class SQLContextProvider {
    static let sharedSQLContent: SQLContext = {
        do {
            return try SQLContext(path: URL.documentsDirectory.appendingPathComponent("budgets.sqlite").path)
        } catch {
            fatalError("Failed to initialize SQLContent: \(error.localizedDescription)")
        }
        
    }()
}
