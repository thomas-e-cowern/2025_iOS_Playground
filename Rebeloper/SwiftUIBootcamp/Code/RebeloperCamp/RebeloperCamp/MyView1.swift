//
//  MyView1.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//
import SwiftUI

struct MyView1: View {
    
    @Environment(Navigation.self) private var navigation
    
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            List {
                Text("Hello, MyView1!")
    //            NavigationLink {
    //                MyView2()
    //            } label: {
    //                Text("Go to View 2")
    //            }
                
//                Button("Go to View2") {
//                    navigation.stack.append(Destination.view2(title: "View 2"))
//                }
                
                Button("View 2") {
                    isPresented.toggle()
                }
            }
            .navigationDestination(isPresented: $isPresented) {
                MyView2(title: "What a view!")
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
