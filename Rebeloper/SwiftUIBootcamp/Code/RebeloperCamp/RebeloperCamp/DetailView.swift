//
//  DetailView.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/27/25.
//

import SwiftUI

struct DetailView: View {
    
    @State private var viewModel = AppController()
    
    var body: some View {
        VStack {
            Text("Hello, \(viewModel.profile.name)!")
        }
    }
}

#Preview {
    DetailView()
}
