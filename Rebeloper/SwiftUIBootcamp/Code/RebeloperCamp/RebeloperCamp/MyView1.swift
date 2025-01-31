//
//  MyView1.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//
import SwiftUI

struct MyView1: View {
    var body: some View {
        VStack {
            Text("Hello, MyView1!")
            NavigationLink {
                MyView2()
            } label: {
                Text("Go to View 2")
            }
        }
        .navigationTitle("MyView1")
    }
}

#Preview {
    NavigationStack {
        MyView1()
    }
}
