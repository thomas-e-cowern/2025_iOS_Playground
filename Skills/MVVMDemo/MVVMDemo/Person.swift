//
//  Person.swift
//  MVVMDemo
//
//  Created by Thomas Cowern on 7/15/25.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var phoneNumber: String
}
