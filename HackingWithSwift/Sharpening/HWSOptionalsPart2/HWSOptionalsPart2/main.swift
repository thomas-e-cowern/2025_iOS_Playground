//
//  main.swift
//  HWSOptionalsPart2
//
//  Created by Thomas Cowern on 1/15/25.
//

import Foundation

print("Hello, World!")

let newScore = "5"
let highScore = "10"
let scoreInt = Int(newScore) ?? 0

// optional chaining...
let newScoreInt = Int(newScore) ?? Int(highScore) ?? 0

// example of use
// let savedData = getLocalCache() ?? getRemoteCopy() ?? loadDefault()

// unsafely unwrapped
// will crash in debug mode but may not crash in release mode
// you have no ideas what will be returned
let username: String? = nil
let unsafe = username.unsafelyUnwrapped

print(unsafe)

func reverse(_ string: String) -> String {
    String(string.reversed())
}

print(reverse("This is in order"))

func reverse(_ string: String?) -> String? {
    if let string = string {
        return String(string.reversed())
    } else {
        return nil
    }
}

func reverseMap(_ string: String?) -> String? {
    string.map { String($0.reversed()) }
}

let names = ["Cheetah", "Puma", "Jaguar", "Panther"]

let first = names.first.map { "This first version of macOS was \($0)" }

print(reverse("This is in order"))
print(reverse(nil))
print(reverseMap("This is in order"))
print(reverseMap(nil))
print(first ?? "No name found")
