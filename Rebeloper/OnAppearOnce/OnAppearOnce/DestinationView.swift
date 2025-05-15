//
//  DestinationView.swift
//  OnAppearOnce
//
//  Created by Thomas Cowern on 5/15/25.
//
import SwiftUI

struct DestinationView: View {
    
    @Environment(OnFirstAppearObservable.self) private var onFirstAppearObservable
    
    var body: some View {
        Text("Destination")
            .onAppear {
                print("******** onAppear **********")
                onFirstAppearObservable.destinationViewAction {
                    print("First appearance of DestinationView")
                }
            }
    }
}

#Preview {
    DestinationView()
        .environment(OnFirstAppearObservable())
}
