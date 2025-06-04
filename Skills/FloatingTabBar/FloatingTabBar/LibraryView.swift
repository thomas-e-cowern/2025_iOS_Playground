//
//  LibraryView.swift
//  FloatingTabBar
//
//  Created by Thomas Cowern on 6/4/25.
//
import SwiftUI

struct LibraryView: View {
    
    @State private var hideTabBar: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("LibraryView")
                Button("Hide Tab Bar") {
                    hideTabBar.toggle()
                }
            }
            .navigationTitle("Library")
        }
    }
}
