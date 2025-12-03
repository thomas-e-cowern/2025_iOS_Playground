//
//  ContentView.swift
//  ActionSheetPlayground
//
//  Created by Thomas Cowern on 12/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var showConfirmationDialog: Bool = false
    
    var body: some View {
        VStack {
            Button {
                showConfirmationDialog.toggle()
            } label: {
                Text("Click me!")
            }
            Button("Delete Item") {
                showConfirmationDialog = true
                    }
                    .confirmationDialog(
                        Text("Confirm Deletion"),
                        isPresented: $showConfirmationDialog,
                        titleVisibility: .visible
                    ) {
                        Button("Delete", role: .destructive) {
                            // Perform deletion action here
                            print("Item deleted!")
                        }
                        Button("Cancel", role: .cancel) {
                            // Dismiss dialog without action
                        }
                    } message: {
                        Text("This action cannot be undone.")
                    }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
