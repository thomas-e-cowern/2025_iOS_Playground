//
//  main.swift
//  HWSResult
//
//  Created by Thomas Cowern on 1/15/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
}

func fetchUnreadCount1(from urlString: String, completionHandler: @escaping (Result<Int, NetworkError>) -> Void)  {
    guard let url = URL(string: urlString) else {
        completionHandler(.failure(.badURL))
        return
    }

    // complicated networking code here
    print("Fetching \(url.absoluteString)...")
    completionHandler(.success(5))
}

// with switch statement
fetchUnreadCount1(from: "https://www.hackingwithswift.com") { result in
    switch result {
        case .success(let count):
            print("switch: \(count) unread messages.")
        case .failure(let error):
            print(error.localizedDescription)
        }
}

// with if let statement
fetchUnreadCount1(from: "https://www.hackingwithswift.com") { result in
    if let count = try? result.get() {
        print("if let: \(count) unread messages.")
    }
}

// with if statement
fetchUnreadCount1(from: "https://www.hackingwithswift.com") { result in
    if case .success(let count) = result {
        print("if: \(count) unread messages.")
    }
}

