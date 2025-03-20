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
    
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")

        do {
            try game.play()
            XCTFail()
        } catch GameError.notInstalled {
            // success!
        } catch {
            XCTFail()
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
    
    func testPlayingMarioBrothersDoesNotThrow() {
        let game = Game(name: "Mario Brothers")

        do {
            try game.play()
        } catch {
            XCTFail()
        }
    }
}
