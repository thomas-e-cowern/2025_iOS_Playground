//
//  LoadFailed.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/8/25.
//
import SwiftUI

struct LoadFailed: View {
    
    var error: (any Error)?
    var retry: () async -> Void
    
    var body: some View {
        ContentUnavailableView {
            Text("Load Error")
                .font(.headline)
        } description: {
            Text("There was an error loading the articles. Please try again later.")
        } actions: {
            Button("Try Again....") {
                Task {
                    await retry()
                }
            }
        }
    }
}

#Preview {
    LoadFailed(retry: {})
}
