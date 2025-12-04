//
//  ContentView.swift
//  ActionSheetPlayground
//
//  Created by Thomas Cowern on 12/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var showConfirmationDialog: Bool = false
    @State var showModifierDialog: Bool = false
    
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
            
            Button {
                showModifierDialog.toggle()
            } label: {
                Text("Show modifier dialog")
            }
            .customConfirmationDialog(isPresented: $showModifierDialog, title: Text("Custom Modifier Title"), message: Text("This is the custom modifier message"), titleVisibility: .hidden) {
                Button {
                    print("Check this out")
                } label: {
                    Text("Print something")
                }
                
                DeleteButton(clicked: {
                    print("Deleted from CV")
                })

            }
            

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
