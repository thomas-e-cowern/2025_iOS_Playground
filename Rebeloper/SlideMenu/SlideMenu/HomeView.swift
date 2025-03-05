//
//  HomeView.swift
//  SlideMenu
//
//  Created by Thomas Cowern on 3/4/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            ForEach(SampleData.sampleData) { item in
                RowView(sampleData: item)
                    .padding()
            }
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // More to come
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

#Preview {
    HomeView()
}

struct RowView: View {
    
    var sampleData: SampleData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sampleData.title)
                .font(.callout)
        }
    }
}
