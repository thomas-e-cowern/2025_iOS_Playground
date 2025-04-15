//
//  BlogListView.swift
//  GlitchBlogTest
//
//  Created by Thomas Cowern on 4/1/25.
//

import SwiftUI

struct BlogListView: View {
    
    @State var blogs: [Blog]
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                ForEach(blogs, id:\.self) { blog in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(blog.title)
                            .font(.headline)
                        Text(blog.snippet)
                            .font(.caption)
                    } //: End of VStack
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }  //: End of ScrollView
            .frame(maxWidth: .infinity)
        } //: End of VStack
        .padding()
        .frame(maxWidth: .infinity)
        .task {
            await loadBlogs()
        }
    }
    
    // MARK: - Methods and functions
    func loadBlogs() async {
        do {
            blogs = try await Webservice().load(Blog.allBlogs)
        } catch {
            print("Error in BlogListView getting blogs: \(error.localizedDescription)")
        }
    }
}

#Preview {
    let blogs = Blog.sampleData
    BlogListView(blogs: blogs)
}
