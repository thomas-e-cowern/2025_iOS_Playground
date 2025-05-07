//
//  Patient.swift
//  SharedStore
//
//  Created by Thomas Cowern on 5/7/25.
//
import Foundation

struct Patient: Identifiable {
    let id: UUID?
    let name: String
    let dateOfBirth: Date
}
