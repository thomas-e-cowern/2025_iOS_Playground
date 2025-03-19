//
//  ConverterTests.swift
//  FirstTestingTests
//
//  Created by Thomas Cowern on 3/19/25.
//

import XCTest
@testable import FirstTesting

final class ConverterTests: XCTestCase {
    
    var sut: Converter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Converter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }
    
    func test32FahrenheitIsZeroCelsius() {
        // given
//        let sut = Converter()
        let input = 32.0

        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)

        // then
        XCTAssertEqual(celsius, 0, accuracy: 0.000001)
    }

    func test212FahrenheitIs100Celsius() {
        // given
//        let sut = Converter()
        let input = 212.0

        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)

        // then
        XCTAssertEqual(celsius, 100, accuracy: 0.000001)
    }
}
