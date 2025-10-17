//
//  ContentView.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 10/17/25.
//

import SwiftUI

struct ContentView: View {
    
    let networkManager = NetworkManager()
    
    @State private var headlines = [News]()
    @State private var messages = [Message]()
    
    var body: some View {
        VStack {
            List {
                Section("Headlines") {
                    ForEach(headlines) { headline in
                        VStack(alignment: .leading) {
                            Text(headline.title)
                                .font(.headline)

                            Text(headline.strap)
                        }
                    }
                }

                Section("Messages") {
                    ForEach(messages) { message in
                        VStack(alignment: .leading) {
                            Text(message.from)
                                .font(.headline)

                            Text(message.text)
                        }
                    }
                }
            }
            .task {
                do {
                    let headlineData = try await networkManager.fetch(.headlines)
                    let messageData = try await networkManager.fetch(.messages)

                    headlines = try JSONDecoder().decode([News].self, from: headlineData)
                    messages = try JSONDecoder().decode([Message].self, from: messageData)
                } catch {
                    print("There was an error getting headlines and messages: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
