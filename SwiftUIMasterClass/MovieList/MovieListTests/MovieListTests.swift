//
//  MovieListTests.swift
//  MovieListTests
//
//  Created by Thomas Cowern on 3/21/25.
//

import XCTest

@testable import MovieList
import SwiftData

@MainActor
final class MovieListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
    }
    
    func test_movieList_emptyAtStart() {
        
        let sut = ContentView()
        
        XCTAssertTrue(sut._movies.wrappedValue.isEmpty)
    }
    
    func test_movieList_hasMoviesAfterAdd() {
        
        let sut = NewMovieView()
        
        let newMovie = Movie(title: "Test Movie", genre: .action)
        
        sut.addNewMovie(
        
        let cvSut = ContentView()
        
        XCTAssertEqual(cvSut._movies.wrappedValue.count, 1)
    }

}
