//
//  ArticleRow.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/8/25.
//
import SwiftUI

struct ArticleRow: View {
    
    var article: Article
    
    var body: some View {
        NavigationLink(value: article) {
            HStack {
                ArticleImage(url: article.thumbnail)
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 10))
                .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(article.section)
                        .font(.caption.weight(.heavy))
                    
                    Text(article.title)
                }
            }
        }
    }
}

#Preview {
    ArticleRow(article: .example)
}
