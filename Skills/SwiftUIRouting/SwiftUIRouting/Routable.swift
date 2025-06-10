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

extension RoutableObject {
    public func navigate(to destination: Destination) {
        stack.append(destination)
    }
    
    public func navigate(to destinations: [Destination]) {
        stack += destinations
    }
    
    public func navigateBack(_ count: Int) {
        guard count > 0 else { return }
        
        let newCount = min(count, stack.count)
        stack.removeLast(newCount)
    }
    
    public func navigateBack(to destination: Destination) {
        if let index = stack.lastIndex(of: destination), index < stack.count {
            stack.removeLast(stack.count - index - 1)
        }
    }
    
    public func navigateToRoot() {
        stack.removeAll()
    }
}
