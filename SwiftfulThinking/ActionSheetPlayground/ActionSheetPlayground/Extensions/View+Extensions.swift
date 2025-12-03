//
//  View+Extensions.swift
//  ActionSheetPlayground
//
//  Created by Thomas Cowern on 12/3/25.
//

import SwiftUI

extension View {
    func customConfirmationDialog<Actions: View>(
        isPresented: Binding<Bool>,
        title: Text,
        message: Text? = nil,
        titleVisibility: Visibility = .visible,
        @ViewBuilder actions: @escaping () -> Actions
    ) -> some View {
        self.modifier(ConfirmationDialogModifier(
            isPresented: isPresented,
            title: title,
            message: message,
            titleVisibility: titleVisibility,
            actions: actions
        ))
    }
}

