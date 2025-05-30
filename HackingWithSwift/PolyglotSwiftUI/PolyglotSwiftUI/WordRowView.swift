//
//  WordRowView.swift
//  PolyglotSwiftUI
//
//  Created by Thomas Cowern on 5/30/25.
//
import SwiftUI

struct WordRowView: View {
    
    var word: String
    @State private var showWord: Bool = false
    
    var body: some View {
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
        .padding()
    }
}

#Preview {
    WordRowView(word: "Test :: word")
}
