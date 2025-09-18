//
//  ErrorWrapper.swift
//  AppleErrorHandling
//
//  Created by Thomas Cowern on 9/18/25.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String

    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
