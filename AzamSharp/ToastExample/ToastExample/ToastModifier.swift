//
//  ToastModifier.swift
//  ToastExample
//
//  Created by Thomas Cowern on 5/23/25.
//
import SwiftUI

struct ToastModifier: ViewModifier {
    
    @State private var type: ToastType?
    @State private var dismissTap: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .environment(\.showToast, ShowToastAction(action: { type in
                withAnimation {
                    self.type = type
                }
                // Cancel previuous dismissal
                dismissTap?.cancel()
                
                // schedule a new dismissal
                let task = DispatchWorkItem {
                    withAnimation(.easeInOut) {
                        self.type = nil
                    }
                }
                
                self.dismissTap = task
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: task)
            }))
            .overlay(alignment: .top) {
                if let type {
                    ToastView(type: type)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .padding(.top, 50)
                }
            }
    }
}

extension View {
    func withToast() -> some View {
        modifier(ToastModifier())
    }
}
