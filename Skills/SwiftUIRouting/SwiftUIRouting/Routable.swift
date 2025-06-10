//
//  Routable.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import SwiftUI

public typealias Routable = View & Hashable

public protocol RoutableObject: AnyObject {
    associatedtype Destination: Routable
    
    var stack: [Destination] { get set }
    
    func navigate(to destination: Destination)
    func navigate(to destinations: [Destination])
    
    func navigateBack(_ count: Int)
    func navigateBack(to destination: Destination)
    
    func navigateToRoot()
}
