//
//  confirmationDialogModifier.swift
//  ActionSheetPlayground
//
//  Created by Thomas Cowern on 12/3/25.
//

import SwiftUI

struct ConfirmationDialogModifier<Actions: View>: ViewModifier {
    @Binding var isPresented: Bool
    let title: Text
    let message: Text?
    @ViewBuilder let actions: () -> Actions
    
    func body(content: Content) -> some View {
        content.confirmationDialog(
            title,
            isPresented: $isPresented,
            titleVisibility: .automatic
        ) {
            actions()
        } message: {
            message
        }
    }
}
