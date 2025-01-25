//
//  ContentView.swift
//  ShortSwiftUI
//
//  Created by Thomas Cowern on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AppService.self) var appService
    
    var body: some View {
        VStack {
            List {
                ForEach(appService.posts) { post in
                    NavigationLink {
                        DetailView(post: post)
                    } label: {
                        cell(post: post)
                    }
                }
            }
        }
        .task {
            do {
                try await appService.fetchPosts()
            } catch {
                print(error.localizedDescription)
            }
            
        }
        .navigationTitle("SwiftUI")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    appService.isDestinationShowing.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(isPresented: Bindable(appService).isDestinationShowing) {
            DestinationView()
        }
    }
    
    func cell(post: Post) -> some View {
        VStack(alignment: .leading) {
            Text(post.title)
            Text(post.body)
                .foregroundStyle(.gray)
                .font(.caption)
        }
    }
}

#Preview {
    ContentView()
}
