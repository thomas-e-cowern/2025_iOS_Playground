//
//  ContentView.swift
//  PolyglotSwiftUI
//
//  Created by Thomas Cowern on 5/30/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var words: [String] = []
    @State var showAddWords: Bool = false
    @State var newWords: [String] = []
    @State var baseWord: String = ""
    @State var translatedWord: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(words, id: \.self) { word in
                        WordRowView(word: word)
                    }
                    .onDelete(perform: delete)
                }
                .listStyle(.plain)
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
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddWords.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
            .alert("Add a new word pair.", isPresented: $showAddWords, actions: {
                TextField("New Word", text: $baseWord)
                TextField("Translation", text: $translatedWord)
                Button("OK") {
                    words.append("\(baseWord)::\(translatedWord)")
                    saveWords()
                    baseWord = ""
                    translatedWord = ""
                }
            })
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
    
    func saveWords() {
        let defaults = UserDefaults.standard
        defaults.set(words, forKey: "Words")
    }
    
    func delete(at offsets: IndexSet) {
        words.remove(atOffsets: offsets)
        saveWords()
    }
}

#Preview {
    ContentView()
}
