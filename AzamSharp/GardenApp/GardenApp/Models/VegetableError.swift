//
//  VegetableError.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/14/25.
//

import Foundation

enum VegetableError: Error, LocalizedError {
    case invalidUrl
    case serverError
    case invalidData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
            case .invalidUrl:
            return "We are unable to connect to the server."
        case .serverError:
            return "There was an error with the server.  Please try again later"
        case .invalidData:
            return "The vegetable was invalid. Please try again later"
        case .unknown(let error):
            return "An unknown error occured: \(error)"
        }
    }
}
