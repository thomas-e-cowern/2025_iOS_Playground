//
//  ContentView.swift
//  CGTPErrorHandling
//
//  Created by Thomas Cowern on 9/18/25.
//

import SwiftUI

struct ContentView: View {
    
    //    @Environment(ErrorHandling.self) var errorHandling: ErrorHandling
    @Environment(ErrorHandler.self) var errorHandler: ErrorHandler
    @State private var text = "Tap to simulate"
    
    var body: some View {
        VStack(spacing: 16) {
            Text(text)
            
            Button("Simulate network error") {
                Task {
                    do {
                        _ = try await fakeNetworkCall()
                    } catch {
                        errorHandler.handle(error)   // <— the only line you need
                    }
                }
            }
            
            Button("Simulate validation error") {
                errorHandler.handle(AppError.validation(message: "Please enter a valid email address."))
            }
        }
        .padding()
    }
    
    private func fakeNetworkCall() async throws -> String {
        try await Task.sleep(nanoseconds: 300_000_000)
        throw URLError(.timedOut)
    }
}

#Preview {
    ContentView()
        .environment(ErrorHandler())
}

enum MyCustomError: LocalizedError {
    case invalidInput
    
    var errorDescription: String? {
        switch self {
        case .invalidInput: return "Invalid input provided."
        }
    }
}
