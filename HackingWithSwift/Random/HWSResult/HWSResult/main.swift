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

fetchUnreadCount1(from: "https://www.hackingwithswift.com") { result in
    switch result {
        case .success(let count):
            print("\(count) unread messages.")
        case .failure(let error):
            print(error.localizedDescription)
        }
}
