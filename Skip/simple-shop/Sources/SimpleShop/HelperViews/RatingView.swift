//
//  RatingView.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/20/25.
//

import SwiftUI

struct RatingView: View {
    
    // MARK: - Variables
    let rating: Double
    let imageSize: Double = 40
    
    // MARK: - Body
    var body: some View {
        HStack {
            ForEach(0...5, id: \.self) { i in
                Image(systemName: starType(rating))
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
            }
        }
    }
    
    // MARK: - Functions and methods
    private func starType(_ index: Double) -> String {
        
        if index <= rating {
            if index <= rating {
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
