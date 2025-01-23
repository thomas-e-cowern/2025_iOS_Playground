//
//  Extension+View.swift
//  ErrorAlertPlayground
//
//  Created by Thomas Cowern on 1/23/25.
//

import SwiftUI

extension View {
    func showCustomAlert(alert: Binding<CustomAlertss?>) -> some View {
        self
            .alert(alert.wrappedValue?.title ?? "Unknow Error", isPresented: Binding(value: alert)) {
                alert.wrappedValue?.alertFormat()
            } message: {
                if let subtitle = alert.wrappedValue?.subtitle {
                    Text(subtitle)
                }
            }
    }
}
