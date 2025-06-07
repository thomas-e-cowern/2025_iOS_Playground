//
//  ArticleView.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/7/25.
//
import SwiftUI

struct ArticleView: View {
    
    var article: Article
    
    var body: some View {
        Text(article.text)
            .padding()
    }
    
}

#Preview {
    ArticleView(article: .example)
}
