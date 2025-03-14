//
//  SpendSmartCloneTests.swift
//  SpendSmartCloneTests
//
//  Created by Thomas Cowern on 3/14/25.
//

//import Testing
import XCTest
import SwiftData

final class SpendSmartCloneTests: XCTestCase {
    
    private var context: ModelContext!
    
    override func setUp() {
        <#code#>
    }

    func testThrowTitleExceptionInsertingDuplicateBudgetCategory() throws {
        let newBudgetCategory = BudgetCategory(title: "Travel", amount: 300)
    }

}
