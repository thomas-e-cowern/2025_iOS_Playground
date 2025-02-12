//
//  ContentView.swift
//  NetworkPro
//
//  Created by Thomas Cowern on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var showAlert: Bool = false
       
       var body: some View {
           NavigationStack {
               List {
                   ForEach(viewModel.coins) { coin in
                       CoinRowView(coin: coin)
                           .onAppear {
                               if coin.id == viewModel.coins.last?.id {
                                   viewModel.loadData()
                               }
                           }
                   }
               }
               .refreshable(action: {
                   viewModel.hanldeRefresh()
               })
               .onReceive(viewModel.$error, perform: { error in
                   if error != nil {
                       showAlert.toggle()
                   }
               })
               .alert("Error", isPresented: $showAlert) {
                   Text(viewModel.error?.localizedDescription ?? "")
                   Button("OK") {}
               }
               .navigationTitle("Live Prices")
           }
       }
}

#Preview {
    ContentView()
}
