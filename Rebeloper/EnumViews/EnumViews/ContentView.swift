//
//  ContentView.swift
//  EnumViews
//
//  Created by Thomas Cowern on 5/14/25.
//

import SwiftUI

enum ResultView: View {
    case success
    case failure(Error)
    
    var body: some View {
        switch self {
        case .success:
            VStack {
                Text("Success!")
                ForEach(0..<10) { index in
                    Text("Count: \(index)")
                }
            }
        case .failure(let error):
            Text("Error: \(error.localizedDescription)")
        }
    }
}

struct ContentView: View {
    
    @State private var isResultSuccessfull: Bool = false
    
    var body: some View {
        VStack {
            Button("Toggle Result") {
                isResultSuccessfull.toggle()
            }
            
            if isResultSuccessfull {
                ResultView.success
            } else {
                ResultView.failure(NSError(domain: "", code: 0, userInfo: nil))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
