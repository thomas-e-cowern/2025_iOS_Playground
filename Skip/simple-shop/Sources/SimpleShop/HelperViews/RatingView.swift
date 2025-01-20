//
//  RatingView.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/20/25.
//

import SwiftUI

struct RatingView: View {
    
    // MARK: - Variables
    let rating: Int
    let imageSize: Double = 40
    
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starType(index))
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
            }
        }
    }
    
    // MARK: - Functions and methods
    private func starType(_ index: Int) -> String {
        
        if index <= rating {
            if index <= Int(rating) {
                return "star.fill"
            } else {
                return "star.leadinghalf.fill"
            }
        }
        return "star"
    }
}

//#Preview {
//    RatingView()
//}
