//
//  ContentView.swift
//  CustomBindingPlayground
//
//  Created by Thomas Cowern on 1/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var title: String = "Hello, Blevinss"
    
    @State private var errorTitle: String? = nil
//    @State private var showError: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
            
            CBChildView(title: $title)
            CBChildView2(title: title) { newTitle in
                title = newTitle
            }
            CBChildView3(title: $title)
            CBChildView3(title: Binding(get: {
                return title
            }, set: { newValue in
                title = newValue
            }))
            
            Button("Click Me") {
                errorTitle = "Oh, no!"
            }
        }
        .padding()
        .alert(errorTitle ?? "Error - Something Went Wrong" , isPresented: Binding(get: {
            return errorTitle != nil
        }, set: { newValue in
            if !newValue {
                errorTitle = nil
            }
        })) {
            Button("OK") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
