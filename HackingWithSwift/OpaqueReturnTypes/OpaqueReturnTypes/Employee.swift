//
//  Employee.swift
//  OpaqueReturnTypes
//
//  Created by Thomas Cowern on 7/28/25.
//

import Foundation

protocol Employee: Equatable {
    
}

struct Coder: Employee {
    
}

struct Boss: Employee {
    
}

func login() -> some Employee {
    return Coder()
}
