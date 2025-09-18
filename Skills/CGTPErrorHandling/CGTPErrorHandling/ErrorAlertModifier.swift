//
//  ErrorAlertModifier.swift
//  CGTPErrorHandling
//
//  Created by Thomas Cowern on 9/18/25.
//

import Foundation
import SwiftUI

/// Attach this to any view to present the handler’s alert automatically.
struct ErrorAlertModifier: ViewModifier {
    @State var handler: ErrorHandler

    func body(content: Content) -> some View {
        content
            .alert(item: $handler.current) { userErr in
                Alert(
                    title: Text(userErr.title),
                    message: Text([userErr.message, userErr.suggestion].compactMap { $0 }.joined(separator: "\n\n")),
                    dismissButton: .default(Text("OK"))
                )
            }
    }
}

extension View {
    func errorAlerts(using handler: ErrorHandler) -> some View {
        modifier(ErrorAlertModifier(handler: handler))
    }
}
