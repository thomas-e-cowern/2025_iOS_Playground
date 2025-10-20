//
//  main.swift
//  SpaceShipOperator
//
//  Created by Thomas Cowern on 10/20/25.
//

import Foundation

infix operator <=>

//func <=><T: Comparable>(lhs: T, rhs: T) -> Int {
//    if lhs < rhs {
//        return -1
//    }
//
//    if lhs > rhs {
//        return 1
//    }
//
//    return 0
//}
func <=><T: Comparable>(lhs: T, rhs: T) -> ComparisonResult {
    if lhs < rhs {
        return .orderedAscending
    }
    
    if lhs > rhs {
        return .orderedDescending
    }
    
    return .orderedSame
}


let left = 7
let right = 6

let result = left <=> right
print(result)
