//
//  ASGlobalErrorsApp.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

@main
struct ASGlobalErrorsApp: App {
    
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.showError) { error, guidance in
                    errorWrapper = ErrorWrapper(error: error, guidance: guidance)
                }
                .sheet(item: $errorWrapper) { errorWrapper in
                    ErrorView(errorWrapper: errorWrapper)
                }
        }
    }
}
