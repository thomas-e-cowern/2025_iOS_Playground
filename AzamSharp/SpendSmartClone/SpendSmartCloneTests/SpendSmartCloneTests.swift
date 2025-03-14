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
    
    private var budgetCategory: BudgetCategory!
    private var context: ModelContext!
    
    @MainActor
    override func setUp() {
        context = mockContainer.mainContext
        self.budgetCategory = BudgetCategory(title: "Travel", amount: 300)
        try! self.budgetCategory.save(context: context)
    }

    func testThrowTitleExceptionInsertingDuplicateBudgetCategory() throws {
        let newBudgetCategory = BudgetCategory(title: "Travel", amount: 300)
        XCTAssertThrowsError(try newBudgetCategory.save(context: context), "No exception was thrown") { error in
            let throwError = error as? BudgetCategoryError
            XCTAssertNil(throwError)
            XCTAssertEqual(BudgetCategoryError.titleAlreadyExists, throwError)
        }
    }

}
