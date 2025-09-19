//
//  ErrorAlerts.swift
//  SwiftUIErrorHandling
//
//  Created by Thomas Cowern on 9/19/25.
//

import Foundation
import SwiftUI

@Observable
final class ErrorAlerts {
    
    var error: Error?
    var title: String?
    var buttonTitle: String?
    var action: (() -> Void)?
    
    func present(_ error: Error, title: String = "Error", buttonTitle: String = "OK", action: (() -> Void)? = nil) {
        print(error.localizedDescription)
        self.error = error
        self.title = title
        self.buttonTitle = buttonTitle
        self.action = action
    }
}
