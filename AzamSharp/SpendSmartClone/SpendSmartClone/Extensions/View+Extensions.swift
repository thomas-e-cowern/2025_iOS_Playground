//
//  View+Extensions.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//
import Foundation
import SwiftUI

extension View {
        
    func withMessageWrapper() -> some View {
        modifier(WithMessageWrapper())
    }
}

