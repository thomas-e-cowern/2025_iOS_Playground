//
//  ContentView.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var articles: [Article] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                List(articles) { article in
                    NavigationLink(value: article) {
                        HStack {
                            AsyncImage(url: article.thumbnail) { phase in
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
                .navigationDestination(for: Article.self, destination: ArticleView.init)
                .navigationTitle("Take Home Test")
            }
            .task(loadArticles)
            .padding()
        }
    }
    
    func loadArticles() async {
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/news")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            articles = try decoder.decode([Article].self, from: data)
        } catch {
            print("Error in loadArticles: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
