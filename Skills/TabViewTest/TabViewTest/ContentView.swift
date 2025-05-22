//
//  ContentView.swift
//  TabViewTest
//
//  Created by Thomas Cowern on 5/21/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                BookInfoView()
                TabSelectionView(tabSelection: $tabSelection)
                
                TabView(selection: $tabSelection) {
                    DiscussionListView()
                        .tag(0)
                    Text("Tab 2")
                        .font(.largeTitle).fontWeight(.black)
                        .tag(1)
                    Text("Tab 3")
                        .font(.largeTitle).fontWeight(.black)
                        .tag(2)
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
