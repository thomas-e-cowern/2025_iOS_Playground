//
//  DeepView.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import SwiftUI

struct DeepView: View {
    @Environment(ErrorCenter.self) private var errorCenter

    var body: some View {
        Button("Trigger Parsing Error") {
            errorCenter.handle(AppError.parsingError("Invalid JSON"))
        }
        .padding()
        .navigationTitle("Deep")
    }
}

#Preview {
    DeepView()
}
