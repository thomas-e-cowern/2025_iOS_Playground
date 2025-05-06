//
//  HTTPClientKey.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 3/30/24.
//

import Foundation
import SwiftUI

private struct HTTPClientKey: EnvironmentKey {
    static let defaultValue: HTTPClient = HTTPClient()
}

extension EnvironmentValues {
  var httpClient: HTTPClient {
    get { self[HTTPClientKey.self] }
    set { self[HTTPClientKey.self] = newValue }
  }
}
