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
        print(title)
        print(error.localizedDescription)
        self.error = error
        self.title = title
        self.buttonTitle = buttonTitle
        self.action = action
    }
}

struct ErrorAlertKey: EnvironmentKey {
    @MainActor
    static let defaultValue = ErrorAlerts()
}

extension EnvironmentValues {
    var errorAlerts: ErrorAlerts {
        get {
            self[ErrorAlertKey.self]
        } set {
            self[ErrorAlertKey.self] = newValue
        }
    }
}

struct ErrorAlertsViewModifier: ViewModifier {
    @Environment(\.errorAlerts) private var errorAlerts
    @State private var isPresented: Bool = false
    
    func body(content: Content) -> some View {
        content
            .alert(errorAlerts.title ?? "Error", isPresented: $isPresented) {
                Button {
                    errorAlerts.action?()
                    errorAlerts.error = nil
                    errorAlerts.title = nil
                    errorAlerts.buttonTitle = nil
                } label: {
                    Text(errorAlerts.buttonTitle ?? "")
                }

            } message: {
                Text(errorAlerts.error?.localizedDescription ?? "")
            }
            .onChange(of: errorAlerts.title) { _, newValue in
                if newValue != nil {
                    isPresented = true
                }
            }

    }
}

#Preview {
    Text("Hello, world!")
        .modifier(ErrorAlertsViewModifier())
}
