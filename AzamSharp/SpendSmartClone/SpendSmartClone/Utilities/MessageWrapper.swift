//
//  MessageWrapper.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//

import Foundation

enum MessageType {
    case error(Error)
    case info(String?)
}

struct MessageWrapper: Identifiable {
    let id = UUID()
    let messageType: MessageType
}
