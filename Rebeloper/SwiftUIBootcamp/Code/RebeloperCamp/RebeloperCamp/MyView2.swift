//
//  MyView2.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

struct MyView2: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("Hello MyView2")
            NavigationLink {
                MyView3()
            } label: {
                Text("Go to View 3")
            }
        }
        .navigationTitle("MyView2")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Back") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MyView2()
    }
}
