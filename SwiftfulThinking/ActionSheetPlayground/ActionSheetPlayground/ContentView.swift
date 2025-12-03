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
            .confirmationDialog("Dialog Title", isPresented: $showConfirmationDialog) {
                Text("Dialog Body")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
