//
//  FirstTestingTests.swift
//  FirstTestingTests
//
//  Created by Thomas Cowern on 3/19/25.
//

import XCTest
@testable import FirstTesting

class FirstTestingTests: XCTestCase {
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testExample() {
        
    }
    
    func testPerformanceExample() {
//        self.measure {
//            
//        }
    }
    
    func testHaterStartsNicely() {
        let hater = Hater()

        XCTAssertFalse(hater.hating)
    }
    
    func testHaterHatesAfterBadDay() {
        var hater = Hater()

        hater.hadABadDay()

        XCTAssertTrue(hater.hating)
    }

    func testHaterHappyAfterGoodDay() {
        var hater = Hater()

        hater.hadAGoodDay()

        XCTAssertFalse(hater.hating)
    }
}
