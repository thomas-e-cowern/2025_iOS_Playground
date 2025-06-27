//
//  Converter.swift
//  First
//
//  Created by Thomas Cowern on 6/27/25.
//

import Foundation

struct Converter {
    func convertToCelsius(farenheit: Double) -> Double {
        let farenheit = Measurement(value: farenheit, unit: UnitTemperature.fahrenheit)
        let celcius = farenheit.converted(to: .celsius)
        return celcius.value
    }
}
