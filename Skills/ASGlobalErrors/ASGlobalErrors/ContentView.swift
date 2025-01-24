//
//  ContentView.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @Environment(\.showError) private var showError
    
    // MARK: - Body
    var body: some View {
        VStack {
            Button("Throw Error") {
                do {
                    throw ErrorType.operationFailed
                } catch {
                    showError(error, "Please try again later.")
                }
            }
        }
        .padding()
//        .alert(errorWrapper?.error.localizedDescription ?? "There was an unknown error", isPresented: $showError) {
//            Button("Ok") {
//                
//            }
//        } message: {
//            Text(errorWrapper?.guidance ?? "")
//        }
    }
}

// MARK: - Preview
struct ContentViewContainer: View {
    
    @State var errorWrapper: ErrorWrapper?
    
    var body: some View {
        ContentView()
            .environment(\.showError) { error, guidance in
                errorWrapper = ErrorWrapper(error: error, guidance: guidance)
            }
            .sheet(item: $errorWrapper) { errorWrapper in
                ErrorView(errorWrapper: errorWrapper)
            }
    }
}


#Preview {
    ContentViewContainer()
}
