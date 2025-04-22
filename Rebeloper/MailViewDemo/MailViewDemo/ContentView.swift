//
//  ContentView.swift
//  MailViewDemo
//
//  Created by Thomas Cowern on 4/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMail: Bool = false
    
    var body: some View {
        VStack {
            Button("Show Mail") {
                showMail.toggle()
            }
            .disabled(!MailView.canSendMail())
            .mailView($showMail, recipients: ["me@gmail.com"])
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
