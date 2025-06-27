//
//  Converter.swift
//  First
//
//  Created by Thomas Cowern on 6/27/25.
//

import Foundation

struct Converter {
    func convertToCelsius(farenheit: Double) -> Double {
        (farenheit - 32) * 5 / 9
    }
}
