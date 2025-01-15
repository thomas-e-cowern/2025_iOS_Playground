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
