//
//  ErrorView.swift
//  ASGlobalErrors
//
//  Created by Thomas Cowern on 1/24/25.
//

import SwiftUI

struct ErrorView: View {
    
//    let errorWrapper: ErrorWrapper
    let errorModel: ErrorModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text(errorModel.error.localizedDescription)
            Text(errorModel.guidance)
            Text(errorModel.contactSupport)
        }
    }
}

#Preview {
//    ErrorView(errorWrapper: ErrorWrapper(error: ErrorType.operationFailed, guidance: "Sorry, but the operation failed and we couldn't complete it. Please try again later. \n\nIf you have continued problems please contact user support."))
    ErrorView(errorModel: ErrorModel(error: ErrorType.operationFailed, guidance: "Sorry, we cant complete this operation at the moment, please try again later.", contactSupport: "Is this countinues to occur, please contact support."))
}
