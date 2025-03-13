//
//  WithMessageWrapper.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//
import Foundation
import SwiftUI

struct WithMessageWrapper: ViewModifier {
    
    @State private var messageWrapper: MessageWrapper?
    
    func body(content: Content) -> some View {
        content.environment(\.showMessage) { messageType in
            print(messageType)
                messageWrapper = MessageWrapper(messageType: messageType)
            }
        .overlay(alignment: .bottom) {
            if messageWrapper != nil {
                MessageView(messageWrapper: $messageWrapper)
            }
        }
    }
}

