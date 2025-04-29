//
//  FirstView.swift
//  SwiftUIRouter
//
//  Created by Thomas Cowern on 4/29/25.
//

import SwiftUI

struct FirstView: View {
    
    let name: String
    
    var body: some View {
        Text("First View")
        Text(name)
    }
}

#Preview {
    FirstView(name: "Benny")
}
