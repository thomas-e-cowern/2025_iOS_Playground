//
//  DestinationView.swift
//  OnAppearOnce
//
//  Created by Thomas Cowern on 5/15/25.
//
import SwiftUI

struct DestinationView: View {
    var body: some View {
        Text("Destination")
            .onAppear {
                print("******** onAppear **********")
            }
    }
}

#Preview {
    DestinationView()
}
