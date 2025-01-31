//
//  MyView3.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

struct MyView3: View {
    
    @Environment(Navigation.self) private var navigation
    
    var body: some View {
        VStack {
            Text("Hello MyView3")
            Button("Back Home") {
                navigation.stack = NavigationPath()
            }
        }
        .navigationTitle("MyView3")
    }
}

#Preview {
    MyView3()
}
