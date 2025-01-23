//
//  Extension+Binding.swift
//  ErrorAlertPlayground
//
//  Created by Thomas Cowern on 1/23/25.
//

import SwiftUI

extension Binding where Value == Bool {
    init<T> (value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
