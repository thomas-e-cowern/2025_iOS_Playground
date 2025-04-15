//
//  NewBlog.swift
//  GlitchBlogTest
//
//  Created by Thomas Cowern on 4/15/25.
//

import SwiftUI

struct NewBlog: View {
    
    @State private var blogTitle: String = ""
    @State private var blogSnippet: String = ""
    @State private var blogBody: String = ""
    
    var body: some View {
        VStack {
            TextField("Blog Title", text: $blogTitle)
            TextField("Blog Snippet", text: $blogSnippet)
            TextField("Blog Body", text: $blogBody, axis: .vertical)
                .multilineTextAlignment(.leading)
            
            Button("Save New Blog") {
                
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    NewBlog()
}
