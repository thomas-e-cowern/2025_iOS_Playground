//
//  ContentView.swift
//  PeekingScrollView
//
//  Created by Thomas Cowern on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    
    let images: [String] = [
        "7AD9C9B8-C9C2-4080-83A9-F66FB004F64F_1_105_c",
        "9ADDCC3C-B21A-4793-84A1-BC1F27CB910D_1_105_c",
        "76C097C3-CAF7-417E-98CB-643DF4A5E1F7_1_105_c",
        "DD92F37F-93BD-442C-9A7F-51346753D5DC_1_105_c",
        "EC12FCB5-62BE-48B3-904E-B7E01BAABEAC_1_105_c"
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
