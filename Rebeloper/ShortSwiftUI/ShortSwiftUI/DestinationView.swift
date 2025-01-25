//
//  DestinationView.swift
//  ShortSwiftUI
//
//  Created by Thomas Cowern on 1/25/25.
//

import SwiftUI

struct DestinationView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Destination View")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

#Preview {
    DestinationView()
}
