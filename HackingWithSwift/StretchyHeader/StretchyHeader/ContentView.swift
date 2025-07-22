//
//  ContentView.swift
//  StretchyHeader
//
//  Created by Thomas Cowern on 7/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                StretchingHeader {
                    Image("mountains")
                        .resizable()
                        .scaledToFill()
                }
                .frame(height: 200)

                Text("Photo by David Klaasen")
                    .font(.title)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ContentView()
}
