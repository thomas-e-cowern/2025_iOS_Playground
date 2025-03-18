//
//  UnitTestingPlaygroundViewModel.swift
//  UnitTestingPlayground
//
//  Created by Thomas Cowern on 3/18/25.
//

import Foundation

class UnitTestingPlaygroundViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}
