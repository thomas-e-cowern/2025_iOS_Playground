//
//  SwiftUIToast.swift
//  SwiftUIToastDemo
//
//  Created by Alex Nagy on 28.03.2025.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var toast = SwiftUIToast()
}

@Observable
class SwiftUIToast {
    
    var isPresented: Bool = false
    var colorSchemeIsLight = true
    
    var title: String?
    var message: String?
    var icon: AnyView?
    var actions: AnyView?
    var alignment: SwiftUIToastAlignment = .top
    
    func present(title: String, message: String? = nil, icon: AnyView? = nil, actions: AnyView? = nil, alignment: SwiftUIToastAlignment = .top, dismissAfter: Duration? = nil) {
        guard self.title == nil else { return }
        self.title = title
        self.message = message
        self.icon = icon
        self.actions = actions
        self.alignment = alignment
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.isPresented = true
        }
        if let dismissAfter {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(dismissAfter.components.seconds)) {
                self.dismiss()
            }
        }
    }
    
    func present(type: SwiftUIToastType, title: String? = nil, message: String? = nil, actions: AnyView? = nil, alignment: SwiftUIToastAlignment = .top, dismissAfter: Duration? = nil) {
        guard self.title == nil else { return }
        
        switch type {
        case .success:
            self.icon = AnyView(Image(systemName: "checkmark.circle.fill").foregroundStyle(.green))
            if let title {
                self.title = title
            } else {
                self.title = "Success"
            }
        case .error:
            self.icon = AnyView(Image(systemName: "xmark.circle.fill").foregroundStyle(.red))
            if let title {
                self.title = title
            } else {
                self.title = "Error"
            }
        case .warning:
            self.icon = AnyView(Image(systemName: "exclamationmark.triangle.fill").foregroundStyle(.orange))
            if let title {
                self.title = title
            } else {
                self.title = "Warning"
            }
        case .info:
            self.icon = AnyView(Image(systemName: "info.circle.fill").foregroundStyle(.secondary))
            if let title {
                self.title = title
            } else {
                self.title = "Info"
            }
        case .progress:
            self.icon = AnyView(ProgressView())
            if let title {
                self.title = title
            } else {
                self.title = "Loading..."
            }
        }
        
        self.message = message
        self.actions = actions
        self.alignment = alignment
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.isPresented = true
        }
        if let dismissAfter {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(dismissAfter.components.seconds)) {
                self.dismiss()
            }
        }
    }
    
    func dismiss() {
        guard self.title != nil else { return }
        isPresented = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.title = nil
        }
    }
}
