//
//  ContentView.swift
//  PolyglotSwiftUI
//
//  Created by Thomas Cowern on 5/30/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var words: [String] = []
    @State private var showWord: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(words, id: \.self) { word in
                        let split = word.split(separator: "::")
                        HStack {
                            Text("\(split[0])")
                                .font(.title)
                                .onTapGesture {
                                    showWord.toggle()
                                }
                            Spacer()
                            if showWord {
                                Text("\(split[1])")
                                    .font(.title)
                                    
                            } else {
                                EmptyView()
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                let defaults = UserDefaults.standard
                
                if let savedWords = defaults.object(forKey: "Words") as? [String] {
                    words = savedWords
                } else {
                    saveInitialValues(to: defaults)
                }
            }
            .navigationTitle("POLYGLOT")
        }
    }
    
    func saveInitialValues(to defaults: UserDefaults) {
        words.append("bear::l'ours")
        words.append("camel::le chameau")
        words.append("cow::la vache")
        words.append("fox::le renard")
        words.append("goat::la chèvre")
        words.append("monkey::le singe")
        words.append("pig::le cochon")
        words.append("rabbit::le lapin")
        words.append("sheep::le mouton")

        defaults.set(words, forKey: "Words")
    }
}

#Preview {
    ContentView()
}
