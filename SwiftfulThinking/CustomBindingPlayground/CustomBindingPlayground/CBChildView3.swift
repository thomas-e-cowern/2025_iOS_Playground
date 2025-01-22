//
//  CBChildView3.swift
//  CustomBindingPlayground
//
//  Created by Thomas Cowern on 1/22/25.
//

import SwiftUI

struct CBChildView3: View {
    
    let title: Binding<String>
    
    var body: some View {
        Text(title.wrappedValue)
            .onAppear {
                title.wrappedValue = "Title 3 updated from child"
            }
    }
}

#Preview {    
    CBChildView3(title: .constant("title 3"))
}
