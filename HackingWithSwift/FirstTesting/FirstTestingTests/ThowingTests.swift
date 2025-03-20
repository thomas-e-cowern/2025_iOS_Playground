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
    
//    func testPlayingBlastazapThrows() {
//        let game = Game(name: "Blastazap")
//
//        do {
//            try game.play()
//            XCTFail()
//        } catch GameError.notInstalled {
//            // success!
//        } catch {
//            XCTFail()
//        }
//    }
    
    // Second way of testing throwing errors....
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")

        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    func testPlayingDeadStormRisingThrows() {
        let game = Game(name: "Dead Storm Rising")

        do {
            try game.play()
            XCTFail()
        } catch GameError.parentalControlsDisallowed {
            // success!
        } catch {
            XCTFail()
        }
    }
    
    // Turn the test into a throwing function that throws if a failure
    func testDeadStormRisingThrows() throws {
        let game = Game(name: "Dead Storm Rising")
        try game.play()
    }
    
    func testCrashyPlaneDoesntThrow() throws {
        let game = Game(name: "CrashyPlane")
        try game.play()
    }
    
    func testPlayingMarioBrothersDoesNotThrow() {
        let game = Game(name: "Mario Brothers")

        do {
            try game.play()
        } catch {
            XCTFail()
        }
    }
    
    // Better way of testing no throws...
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
}
