//
//  URLSessionMock.swift
//  TakeHomeTestTests
//
//  Created by Thomas Cowern on 6/9/25.
//

import Foundation
@testable import TakeHomeTest

struct URLSessionMock: DataFetching {
    var data: Data
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        (data, URLResponse())
    }
}
