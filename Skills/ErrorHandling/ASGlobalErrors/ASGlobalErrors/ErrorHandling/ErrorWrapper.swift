//
//  ErrorWrapper.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String?
}

enum ErrorType: Error {
    case operationFailed
}
