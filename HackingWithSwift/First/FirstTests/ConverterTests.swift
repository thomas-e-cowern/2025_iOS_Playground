//
//  ConverterTests.swift
//  FirstTests
//
//  Created by Thomas Cowern on 6/27/25.
//

import Testing
@testable import First

struct ConverterTests {

    @Test func farenheitToCelcius() {
        let sut = Converter()
        
        let input1: Double = 32
        let expected1: Double = 0
        #expect(sut.convertToCelsius(farenheit: input1) == expected1)
        
        let input2: Double = 212
        let expected2: Double = 100
        #expect(sut.convertToCelsius(farenheit: input2) == expected2)
    }
}
