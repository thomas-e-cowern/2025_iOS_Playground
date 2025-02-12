//
//  ContentView.swift
//  NetworkPro
//
//  Created by Thomas Cowern on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
       
       var body: some View {
           NavigationStack {
               List {
                   ForEach(viewModel.coins) { coin in
                       CoinRowView(coin: coin)
                   }
               }
               .navigationTitle("Live Prices")
           }
       }
}

#Preview {
    ContentView()
}
