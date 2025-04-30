//
//  NetworkObserver.swift
//  NetworkMonitoring
//
//  Created by Thomas Cowern on 4/30/25.
//
import SwiftUI
import Network

@Observable
class NetworkObserver {
    private let networkMonitor = NWPathMonitor()
    private var workerQueue = DispatchQueue(label: "NetworkObserver")
    var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
}

extension EnvironmentValues {
    @Entry var network = NetworkObserver()
}
