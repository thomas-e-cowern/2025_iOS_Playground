//
//  Converter.swift
//  FirstTesting
//
//  Created by Thomas Cowern on 3/19/25.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5 / 9
    }
}
