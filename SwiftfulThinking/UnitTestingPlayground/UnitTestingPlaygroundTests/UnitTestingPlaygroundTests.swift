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
        let isPremium = Bool.random()
        
        // When
        let vm = UnitTestingPlaygroundViewModel(isPremium: isPremium)
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingPlaygroundViewModel_dataArray_ShouldAddItem() {
        // Given
        let vm = UnitTestingPlaygroundViewModel(isPremium: Bool.random())
        let randomInt = TestHelpers().randomInt()
        let loopCount = Int.random(in: 1..<50)
        
        // When
//        vm.addItem(item: UUID().uuidString)
        // or
        
//        vm.addItem(item: TestHelpers().randomString(length: randomInt))
        
        for _ in 0..<loopCount {
            vm.addItem(item: TestHelpers().randomString(length: randomInt))
        }
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingPlaygroundViewModel_dataArray_ShouldNotAddItemEmptyString() {
        // Given
        let vm = UnitTestingPlaygroundViewModel(isPremium: Bool.random())
        
        // When
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertFalse(!vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
        XCTAssertNotEqual(vm.dataArray.count, 1)
    }
    
    func test_UnitTestingPlaygroundViewModel_dataArray_selectedItemIsNilWhenEmptyStringAdded() {
        // Given
        let vm = UnitTestingPlaygroundViewModel(isPremium: Bool.random())
        
        // When
        vm.addItem(item: "")
        
        // Then
        XCTAssertNil(vm.selectedItem)
        
    }
    
    func test_UnitTestingPlaygroundViewModel_dataArray_selectedItemStartsNil() {
        // Given
        let vm = UnitTestingPlaygroundViewModel(isPremium: Bool.random())
        
        // When
        // Skipped
        
        // Then
        XCTAssertNil(vm.selectedItem)
        
    }
    
    func test_UnitTestingPlaygroundViewModel_dataArray_selectedItemIsNilWhenSelectingInvalidItem() {
        // Given
        let vm = UnitTestingPlaygroundViewModel(isPremium: Bool.random())
        
        // When
        vm.selectItem(item: UUID().uuidString)
        
        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingPlaygroundViewModel_dataArray_selectedItemIsSelected() {
        // Given
        let vm = UnitTestingPlaygroundViewModel(isPremium: Bool.random())
        
        // When
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)
    }

}

// Random string and int for testing
struct TestHelpers {
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func randomInt() -> Int {
        Int.random(in: 1..<25)
    }
}

