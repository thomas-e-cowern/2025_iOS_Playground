//
//  ErrorView.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text(errorWrapper.error.localizedDescription)
            Text(errorWrapper.guidance ?? "")
        }
    }
}

#Preview {
    ErrorView(errorWrapper: ErrorWrapper(error: ErrorType.operationFailed, guidance: "Please try again later"))
}
