//
//  ContentView.swift
//  NetworkMonitorTest
//
//  Created by Thomas Cowern on 5/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var networkMonitor = NetworkMonitor()
    
    var body: some View {
        VStack {
            Text("Network Monitor!")
            Image(systemName: networkMonitor.isConnected ? "wifi" : "wifi.slash")
                .imageScale(.large)
                .foregroundStyle(networkMonitor.isConnected ? .green : .red)
            
            if networkMonitor.isCellular {
                Image(systemName: "candybarphone")
            }
        }
        .padding()
        .onAppear {
            networkMonitor.start()
        }
        .onDisappear {
            networkMonitor.stop()
        }
    }
}

#Preview {
    ContentView()
}
