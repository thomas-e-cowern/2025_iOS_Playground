//
//  GlobalErrorAlertModifier.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import SwiftUI

private struct GlobalErrorAlertModifier: ViewModifier {
    @Environment(ErrorCenter.self) private var errorCenter

    func body(content: Content) -> some View {
        content
            .alert(
                "Error",
                isPresented: Binding(
                    get: { errorCenter.currentError != nil },
                    set: { if !$0 { errorCenter.clear() } }
                ),
                presenting: errorCenter.currentError
            ) { _ in
                Button("OK", role: .cancel) { errorCenter.clear() }
            } message: { err in
                Text(err.localizedDescription)
            }
    }
}

extension View {
    func globalErrorAlert() -> some View {
        modifier(GlobalErrorAlertModifier())
    }
}

