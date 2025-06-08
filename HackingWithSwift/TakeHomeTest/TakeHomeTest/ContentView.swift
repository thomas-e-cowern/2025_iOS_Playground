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
            
            switch viewModel.loadState {
            case .failed:
                ContentUnavailableView {
                    Text("Load Error")
                        .font(.headline)
                } description: {
                    Text("There was an error loading the articles. Please try again later.")
                } actions: {
                    Button("Try Again....") {
                        Task {
                            await viewModel.loadArticles()
                        }
                    }
                }
                
            default:
                if viewModel.articles.isEmpty {
                    ProgressView {
                        Text("Loading...")
                            .controlSize(.extraLarge)
                    }
                } else {
                    List(viewModel.articles, rowContent: ArticleRow.init)
                    .navigationDestination(for: Article.self, destination: ArticleView.init)
                    .navigationTitle("Take Home Test")
                }
            }
        }
        .task(viewModel.loadArticles)
    }
}

#Preview {
    ContentView()
}
