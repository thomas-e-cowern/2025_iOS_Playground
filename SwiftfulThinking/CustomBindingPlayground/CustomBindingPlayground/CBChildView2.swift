//
//  CBChildView2.swift
//  CustomBindingPlayground
//
//  Created by Thomas Cowern on 1/22/25.
//

import SwiftUI

struct CBChildView2: View {
    
    let title: String
    let setTitle: (String) -> Void
    
    var body: some View {
        Text(title)
            .onAppear {
//                setTitle("Title 2 updated from child")
            }
    }
}

#Preview {
    
    let setTitle: (String) -> Void = { _ in }
    
    return CBChildView2(title: "title 2", setTitle: setTitle)
}
