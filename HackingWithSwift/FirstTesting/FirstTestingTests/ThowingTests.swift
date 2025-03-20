//
//  ThowingTests.swift
//  FirstTestingTests
//
//  Created by Thomas Cowern on 3/20/25.
//

import XCTest

@testable import FirstTesting

class ThrowingTests: XCTestCase {
    
    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")

        do {
            try game.play()
            XCTFail()
        } catch GameError.notPurchased {
            // success!
        } catch {
            XCTFail()
        }
    }
}
