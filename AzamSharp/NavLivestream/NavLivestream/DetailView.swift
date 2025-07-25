//
//  DetailView.swift
//  NavLivestream
//
//  Created by Thomas Cowern on 7/25/25.
//

import SwiftUI

struct DetailView: View {
    
    let name: String
    
    var body: some View {
        Text(name)
    }
}

#Preview {
    DetailView(name: "Bob")
}
