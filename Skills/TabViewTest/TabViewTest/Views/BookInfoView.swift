//
//  BookInfoView.swift
//  TabViewTest
//
//  Created by Thomas Cowern on 5/21/25.
//

import SwiftUI

struct BookInfoView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("bookCover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Text("To Have and Have Not")
                    .font(.headline)
                
                Text("Ernest Hemingway")
                    .font(.subheadline)
                
                BookInfoButtonsView()
            }
            
            Spacer()
        }
        .padding(.vertical)
    }
}

#Preview {
    BookInfoView()
}
