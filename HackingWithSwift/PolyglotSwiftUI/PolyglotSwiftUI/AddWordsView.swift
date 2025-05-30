//
//  AddWordsView.swift
//  PolyglotSwiftUI
//
//  Created by Thomas Cowern on 5/30/25.
//
import SwiftUI

struct AddWordsView: View {
    
    @State var baseWord: String = ""
    @State var translatedWord: String = ""
//    @Binding var newWords: [String]
    
    var body: some View {
        VStack {
            Text("Add a new word and it's translation below")
            TextField("Base word", text: $baseWord)
            TextField("Translated word", text: $translatedWord)
            Button {
                // More to come...
            } label: {
                Text("Save Words")
            }
            .buttonStyle(.bordered)

        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
    AddWordsView(baseWord: "Egg", translatedWord: "Huevo")
}
