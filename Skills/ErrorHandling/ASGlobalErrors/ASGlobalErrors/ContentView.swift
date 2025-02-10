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
//                    showError(error, "")
                    showError(error)
                }
            }
        }
        .padding()
    }
}

// MARK: - Preview
struct ContentViewContainer: View {
    
//    @State var errorWrapper: ErrorWrapper?
    @State var errorModel: ErrorModel?
    
    var body: some View {
        ContentView()
//            .environment(\.showError) { error, guidance in
//                errorWrapper = ErrorWrapper(error: error, guidance: guidance)
//            }
//            .sheet(item: $errorWrapper) { errorWrapper in
//                ErrorView(errorWrapper: errorWrapper)
//            }
            .environment(\.showError) { error, guidance, contactSupport in
                errorModel = ErrorModel(error: error, guidance: guidance, contactSupport: contactSupport)
            }
            .sheet(item: $errorModel) { errorModel in
                ErrorView(errorModel: errorModel)
            }
    }
}


#Preview {
    ContentViewContainer()
}
