//
//  String+Extensions.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//
import Foundation

extension String {
    
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}
