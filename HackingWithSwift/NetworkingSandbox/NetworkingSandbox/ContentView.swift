//
//  ContentView.swift
//  NetworkingSandbox
//
//  Created by Thomas Cowern on 10/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.networkManager) var networkManager
    
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
                    headlines = try await networkManager.fetch(.headlines)
                    messages = try await networkManager.fetch(.messages)
                } catch {
                    print("There was an error getting headlines and messages: \(error.localizedDescription)")
                }
            }
            .task {
                do { 
                    let city = try await networkManager.fetch(.city)
                    print(city)
                } catch {
                    print("Error getting cities: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
