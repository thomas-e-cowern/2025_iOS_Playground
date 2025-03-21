//
//  UnitTestingPlaygroundTests.swift
//  UnitTestingPlaygroundTests
//
//  Created by Thomas Cowern on 3/18/25.
//

// Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming structure: text_[struct or class]_[variable or function]_[expected result]

// Testing Structure:  Given, When, Then

import XCTest
@testable import UnitTestingPlayground

class UnitTestingPlaygroundTests: XCTestCase {

    // testing true
    func test_UnitTestingPlaygroundViewModel_isPremium_shouldBeTrue() {
        
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingPlaygroundViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
    }
    
    // testing false
    func test_UnitTestingPlaygroundViewModel_isPremium_shouldBeFalse() {
        
        // Given
        let userIsPremium: Bool = false
        
        // When
        let vm = UnitTestingPlaygroundViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium)
    }
    
    // testing random bool
    func test_UnitTestingPlaygroundViewModel_isPremium_shouldBeInjectedValue() {
        
        // Given
        let userIsPremium: Bool = Bool.random()
        
        // When
        let vm = UnitTestingPlaygroundViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    // testing random multiple times to ensure coverage
    func test_UnitTestingPlaygroundViewModel_isPremium_shouldBeInjectedValue_stress() {
        
        for _ in 0..<100 {
            // Given
            let userIsPremium: Bool = Bool.random()
            
            // When
            let vm = UnitTestingPlaygroundViewModel(isPremium: userIsPremium)
            
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingPlaygroundViewModel_dataArray_ShouldBeEmpty() {
        // Given
        
        // When
        let vm = UnitTestingPlaygroundViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }

}
