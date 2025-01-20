//
//  RatingView.swift
//  simple-shop
//
//  Created by Thomas Cowern on 1/20/25.
//

import SwiftUI

struct RatingView: View {
    
    // MARK: - Variables
    let rating: Rating
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text(rating.rateToString())
            Text(rating.countToString())
//            ForEach(0...5, id: \.self) { i in
//                Image(systemName: starType(rating))
//                    .foregroundStyle(.yellow)
//                    .font(.largeTitle)
//            }
        }
        .padding()
    }
    
    // MARK: - Functions and methods
//    private func starType(_ index: Double) -> String {
//        print(index)
//        if index <= rating {
//            if index <= rating {
//                return "star.fill"
//            } else {
//                return "star.leadinghalf.fill"
//            }
//        }
//        return "star"
//    }
}

//#Preview {
//    RatingView()
//}
