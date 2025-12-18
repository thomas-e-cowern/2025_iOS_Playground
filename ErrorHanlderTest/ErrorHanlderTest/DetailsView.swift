//
//  DetailsView.swift
//  ErrorHanlderTest
//
//  Created by Thomas Cowern on 12/18/25.
//

import SwiftUI

struct DetailsView: View {
    @Environment(ErrorCenter.self) private var errorCenter

    var body: some View {
        VStack(spacing: 16) {
            Button("Trigger Network Error") {
                errorCenter.handle(AppError.networkError("No Internet"))
            }

            NavigationLink("Go deeper") {
                DeepView()
            }
        }
        .padding()
        .navigationTitle("Details")
    }
}

#Preview {
    DetailsView()
}
