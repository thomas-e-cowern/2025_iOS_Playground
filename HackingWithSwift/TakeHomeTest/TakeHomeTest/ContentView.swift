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
                LoadFailed(error: viewModel.loadError, retry: viewModel.loadArticles)
            default:
                if viewModel.articles.isEmpty {
                    ProgressView {
                        Text("Loading...")
                            .controlSize(.extraLarge)
                    }
                } else {
                    List(viewModel.filteredArticles, rowContent: ArticleRow.init)
                    .navigationDestination(for: Article.self, destination: ArticleView.init)
                    .navigationTitle("Take Home Test")
                    .refreshable {
                        await viewModel.loadArticles()
                    }
                    .searchable(text: $viewModel.filterText, prompt: "Search articles..")
                }
            }
        }
        .task(viewModel.loadArticles)
    }
}

#Preview {
    ContentView()
}
