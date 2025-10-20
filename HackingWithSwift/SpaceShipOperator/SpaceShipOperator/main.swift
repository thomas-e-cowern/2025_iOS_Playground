//
//  main.swift
//  SpaceShipOperator
//
//  Created by Thomas Cowern on 10/20/25.
//

import Foundation

infix operator <=>

func <=><T: Comparable>(lhs: T, rhs: T) -> Int {
    if lhs < rhs {
        return -1
    }
    
    if lhs > rhs {
        return 1
    }
    
    return 0
}
