//
//  TakeHomeTestTests.swift
//  TakeHomeTestTests
//
//  Created by Thomas Cowern on 6/8/25.
//

import Testing
import Foundation
@testable import TakeHomeTest

@MainActor
struct TakeHomeTestTests {

    @Test func viewModelStartsEmpty() async throws {
        let viewModel = ContentView.ViewModel()
        
        #expect(viewModel.articles.isEmpty, "There should be not article initially")
        #expect(viewModel.loadState == .loading, "The viewModel should be loading")
    }
    
    @Test func viewModelLoadsArticle() async throws {
        let viewModel = ContentView.ViewModel()
        await viewModel.loadArticles()
        
        // Same test different ways
        #expect(viewModel.articles.count > 0, "There should be articles after loading")
        #expect(viewModel.articles.isEmpty == false, "There should be articles after loading")
        
        // Load state test
        #expect(viewModel.loadState == .loaded, "The viewModel should be loaded")
    }
    
    @Test func viewModelNoFiltering() async throws {
        let viewModel = ContentView.ViewModel()
        await viewModel.loadArticles()
        
        #expect(viewModel.filteredArticles == viewModel.articles, "No filter, all articles should be shown")
    }
    
    @Test func viewModelFilterOne() async throws {
        let viewModel = ContentView.ViewModel()
        await viewModel.loadArticles()
        viewModel.filterText = viewModel.articles.first?.title ?? ""
        
        #expect(viewModel.filteredArticles.count == 1, "Only one article should remain after filtering")
    }

    @Test func viewModelFilterEmpty() async throws {
        let viewModel = ContentView.ViewModel()
        await viewModel.loadArticles()
        viewModel.filterText = "XXX NOT HAPPENING"
        
        #expect(viewModel.filteredArticles.count == 0, "No articles should remain after filtering")
    }
}
