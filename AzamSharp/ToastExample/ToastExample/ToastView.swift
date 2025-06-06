//
//  ToastView.swift
//  ToastExample
//
//  Created by Thomas Cowern on 5/23/25.
//
import SwiftUI

struct ShowToastAction {
    typealias Action = (ToastType) -> Void
    let action: Action
    
    func callAsFunction(_ type: ToastType) {
        action(type)
    }
}

extension EnvironmentValues {
    @Entry var showToast = ShowToastAction(action: { _ in })
}

struct ToastView: View {
    
    let type: ToastType
    
    var body: some View {
        HStack {
            type.icon
                .foregroundStyle(.white)
            Text(type.message)
                .foregroundStyle(.white)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(type.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 4)
        .padding(.horizontal, 16)
    }
}

#Preview {
    ToastView(type: .success("Data was saved!"))
    ToastView(type: .error("Operation failed!"))
    ToastView(type: .info("Various Information!"))
}
