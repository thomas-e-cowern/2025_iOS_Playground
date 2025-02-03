//
//  MyView2.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

struct MyView2: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(Navigation.self) private var navigation
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
//            NavigationLink {
//                MyView3()
//            } label: {
//                Text("Go to View 3")
//            }
            Button("Go to View3") {
                navigation.stack.append(Destination.view3)
            }
//            NavigationLink(value: Destination.view3) {
//                Text("Go to view3")
//            }
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
        MyView2(title: "title")
    }
}
