//
//  Extension+Binding.swift
//  CustomBindingPlayground
//
//  Created by Thomas Cowern on 1/22/25.
//

import SwiftUI

extension Binding where Value == Bool {
    init (value: Binding<String?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
