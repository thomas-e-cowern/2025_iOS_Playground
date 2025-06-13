//
//  RandomizeErrors.swift
//  AlertsPlayground
//
//  Created by Thomas Cowern on 6/13/25.
//

import Foundation

struct RandomizeErrors {
    
    func giveMeAnError() -> MyAppError {
        let errorArray: [MyAppError] = [.noNetwork, .invalidPassword, .invalidUsername]
        
        let randomNumber = Int.random(in: 0..<errorArray.count)
        
        return errorArray[randomNumber]
    }
}
