//
//  CBChildView.swift
//  CustomBindingPlayground
//
//  Created by Thomas Cowern on 1/22/25.
//

import SwiftUI

struct CBChildView: View {
    
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .onAppear {
//                title = "Hello from the child!"
            }
    }
}

#Preview {
    CBChildView(title: .constant("title"))
}
