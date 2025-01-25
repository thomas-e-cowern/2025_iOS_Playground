//
//  DetailView.swift
//  ShortSwiftUI
//
//  Created by Thomas Cowern on 1/25/25.
//

import SwiftUI

struct DetailView: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.title)
                .padding(.bottom)
            Text(post.body)
        }
        .padding()
    }
}

#Preview {
    DetailView(post: Post(id: 1, userId: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"))
}
