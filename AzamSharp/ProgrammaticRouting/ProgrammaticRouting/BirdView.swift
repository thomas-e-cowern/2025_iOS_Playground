//
//  BirdView.swift
//  ProgrammaticRouting
//
//  Created by Thomas Cowern on 1/12/26.
//

import SwiftUI

struct BirdView: View {
    
    @State var bird: Birds?
    
    var body: some View {
        Text(bird?.name ?? "No Bird")
        Text(bird?.color ?? "No Color")
    }
}

#Preview {
    BirdView(bird: Birds.example.first)
}
