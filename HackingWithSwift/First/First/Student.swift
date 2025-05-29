//
//  Student.swift
//  First
//
//  Created by Thomas Cowern on 5/29/25.
//


struct Student {
    var isAtSchool = false

    mutating func goToSchool() {
        isAtSchool = true
    }

    mutating func leaveSchool() {
        isAtSchool = false
    }
}