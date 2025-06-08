//
//  ArticleImage.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/8/25.
//
import SwiftUI

struct ArticleImage: View {
    var url: URL
   
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                Image(systemName: "newspaper")
            }
        }
    }
}

#Preview {
    ArticleImage(url: Article.example.image)
}
