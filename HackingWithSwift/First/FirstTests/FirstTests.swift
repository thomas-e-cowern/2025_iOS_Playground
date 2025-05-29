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

    @Test func studentGoesToSchool() async throws {
        var student = Student()
        student.goToSchool()
        #expect(student.isAtSchool == true)
    }

    @Test func studentLeavesSchool() async throws {
        var student = Student()
        student.goToSchool()
        student.leaveSchool()
        #expect(student.isAtSchool == false)
    }
}
