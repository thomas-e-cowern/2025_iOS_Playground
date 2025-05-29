//
//  FirstTests.swift
//  FirstTests
//
//  Created by Thomas Cowern on 5/29/25.
//

import Testing
@testable import First

struct FirstTests {

    @Test func studentStartsAtHome() async throws {
        let student = Student()
        #expect(student.isAtSchool == false)
    }

}
