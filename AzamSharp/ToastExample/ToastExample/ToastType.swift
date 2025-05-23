//
//  ToastType.swift
//  ToastExample
//
//  Created by Thomas Cowern on 5/23/25.
//
import SwiftUI

enum ToastType {
    case success(String)
    case error(String)
    case info(String)
    
    var backgroundColor: Color {
        switch self {
        case .success:
            return .green.opacity(0.9)
        case .error:
            return .red.opacity(0.9)
        case .info:
            return .blue.opacity(0.9)
        }
    }
    
    var icon: Image {
        switch self {
        case .success:
            return Image(systemName: "checkmark.circle")
        case .error:
            return Image(systemName: "exclamationmark.triangle")
        case .info:
            return Image(systemName: "info.circle")
        }
    }
    
    var message: String {
        switch self {
        case .success(let msg):
            return msg
        case .error(let msg):
            return msg
        case .info(let msg):
            return msg
        }
    }
}
