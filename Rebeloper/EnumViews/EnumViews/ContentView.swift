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
            Text("Success!")
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
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
