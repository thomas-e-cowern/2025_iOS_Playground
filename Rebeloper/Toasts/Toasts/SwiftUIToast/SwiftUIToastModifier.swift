//
//  SwiftUIToastModifier.swift
//  SwiftUIToastDemo
//
//  Created by Alex Nagy on 28.03.2025.
//

import SwiftUI

struct SwiftUIToastModifier: ViewModifier {
    
    @State private var toast = SwiftUIToast()
    
    func body(content: Content) -> some View {
        content
            .environment(\.toast, toast)
            .background {
                Color.clear
                    .windowOverlay {
                        VStack(spacing: 0) {
                            if toast.alignment == .bottom {
                                Spacer(minLength: 0)
                            }
                            
                            VStack {
                                HStack {
                                    if let icon = toast.icon {
                                        icon
                                            .font(.title2)
                                    }
                                    
                                    VStack {
                                        Text(toast.title ?? "")
                                            .foregroundStyle(.secondary)
                                        
                                        if let message = toast.message {
                                            Text(message)
                                                .foregroundStyle(.secondary.opacity(0.5))
                                                .multilineTextAlignment(.leading)
                                        }
                                    }
                                    .font(.caption)
                                    .bold()
                                    .padding(.horizontal, 12)
                                    
                                    if let icon = toast.icon {
                                        icon
                                            .font(.title2)
                                            .opacity(0)
                                    }
                                }
                                
                                if let actions = toast.actions {
                                    actions
                                }
                            }
                            .padding(.horizontal, 18)
                            .padding(.vertical, 9)
                            .background(Material.ultraThin)
                            .clipShape(.rect(cornerRadius: 24))
                            .padding(6)
                            .scaleEffect(toast.isPresented ? 1 : 0.5)
                            .animation(.easeInOut, value: toast.isPresented)
                            .offset(y: toast.isPresented ? 0 : (toast.alignment == .top ? -200 : 200))
                            
                            if toast.alignment == .top {
                                Spacer(minLength: 0)
                            }
                        }
                    }
            }
    }
}

extension View {
    func usesSwiftUIToast() -> some View {
        modifier(SwiftUIToastModifier())
    }
}
