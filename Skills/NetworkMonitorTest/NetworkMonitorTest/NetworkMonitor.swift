//
//  NetworkMonitor.swift
//  NetworkMonitorTest
//
//  Created by Thomas Cowern on 5/24/25.
//
import Foundation
import Network
import Observation

@Observable
final class NetworkMonitor {
    var isConnected: Bool = false
    var isCellular: Bool = false
    
    private let nwMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue.global()
    
    public func start() {
        nwMonitor.start(queue: workerQueue)
        nwMonitor.pathUpdateHandler = {[weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                self?.isCellular = path.usesInterfaceType(.cellular)
            }
        }
    }
    
    public func stop() {
        nwMonitor.cancel()
    }
}

