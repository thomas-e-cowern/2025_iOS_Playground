//
//  Router.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import Foundation
import SwiftUI

public final class Router<Routes: Routable>: ObservableObject, RoutableObject {
    public typealias Destination = Routes
    
    @Published public var stack: [Destination] = []
    
    public init() {}
}
