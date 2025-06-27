//
//  ConverterTests.swift
//  FirstTests
//
//  Created by Thomas Cowern on 6/27/25.
//

import Testing
@testable import First
import Numerics

struct ConverterTests {

    @Test func checkThirtyTwoFarenheitIsZeroCelcius() {
        // Given
        let sut = Converter()
        let input: Double = 32
        let expected: Double = 0
        
        // When
        let output: Double = sut.convertToCelsius(farenheit: input)
        
        // Then
        #expect(output.isApproximatelyEqual(to: expected, absoluteTolerance: 0.00001))
    }
    
    @Test func checkTwoHundredTwelveFarenheitIsOneHundredCelcius() {
        // Given
        let sut = Converter()
        let input: Double = 212
        let expected: Double = 100
        
        // When
        let output: Double = sut.convertToCelsius(farenheit: input)
        
        // Then
        #expect(output.isApproximatelyEqual(to: expected, absoluteTolerance: 0.00001))
    }
    
    @Test func checkOneHundredFarenheitIsThirtySevenCelcius() {
        // Given
        let sut = Converter()
        let input: Double = 100
        let expected: Double = 37.77777
        
        // When
        let output: Double = sut.convertToCelsius(farenheit: input)
        
        // Then
        #expect(output.isApproximatelyEqual(to: expected, absoluteTolerance: 0.00001))
    }
}
