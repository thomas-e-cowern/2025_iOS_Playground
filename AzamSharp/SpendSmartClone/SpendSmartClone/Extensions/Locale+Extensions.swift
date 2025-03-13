//
//  Locale+Extensions.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//
import Foundation

extension Locale {
    
    static var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    
}
