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
                    NavigationLink(article.title, value: article)
                }
                .navigationDestination(for: Article.self) { article in
                    Text(article.text)
                }
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
            articles = try decoder.decode([Article].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
