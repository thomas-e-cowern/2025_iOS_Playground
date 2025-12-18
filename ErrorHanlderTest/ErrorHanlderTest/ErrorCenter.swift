//
//  ErrorCenter.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import Observation
import Foundation

@Observable
final class ErrorCenter {
    var currentError: AppError?

    func handle(_ error: Error, file: StaticString = #fileID, line: UInt = #line) {
        print("Error handled: \(error) [\(file):\(line)]")
        currentError = (error as? AppError) ?? .unknownError
    }

    func clear() { currentError = nil }
}
