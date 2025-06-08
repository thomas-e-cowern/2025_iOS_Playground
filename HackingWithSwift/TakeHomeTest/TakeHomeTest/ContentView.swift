//
//  ContentView.swift
//  TakeHomeTest
//
//  Created by Thomas Cowern on 6/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.articles, rowContent: ArticleRow.init)
                .navigationDestination(for: Article.self, destination: ArticleView.init)
                .navigationTitle("Take Home Test")
            }
            .task(viewModel.loadArticles)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
