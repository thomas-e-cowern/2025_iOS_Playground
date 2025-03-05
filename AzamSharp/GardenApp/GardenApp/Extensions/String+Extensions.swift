//
//  String+Extensions.swift
//  GardenApp
//
//  Created by Thomas Cowern on 3/5/25.
//

import Foundation

extension String {
    
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}
