//
//  ContentView.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var errorWrapper: ErrorWrapper?
    @State private var showError: Bool = false
    
    var body: some View {
        VStack {
            Button("Throw Error") {
                do {
                    throw ErrorType.operationFailed
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Please try again later.")
                    showError.toggle()
                }
            }
        }
        .padding()
        .sheet(item: $errorWrapper) { errorWrapper in
            VStack {
                ErrorView(errorWrapper: errorWrapper)
            }
        }
//        .alert(errorWrapper?.error.localizedDescription ?? "There was an unknown error", isPresented: $showError) {
//            Button("Ok") {
//                
//            }
//        } message: {
//            Text(errorWrapper?.guidance ?? "")
//        }
    }
}

#Preview {
    ContentView()
}
