//
//  MyCell.swift
//  PeekingScrollView
//
//  Created by Thomas Cowern on 1/7/25.
//

import SwiftUI

struct MyCell: View {
    
    let index: Int
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(index)")
                .font(.system(size: 60))
                .bold()
            Spacer(minLength: 40)
            Text(imageName)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .bold()
            Color.clear.frame(height: 0)
        }
        .foregroundStyle(.white)
        .padding()
        .background {
            Image(imageName)
                .resizable()
                .scaledToFit()
        }
        .contentShape(
            RoundedRectangle(cornerRadius: 15)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 15)
        )
    }
}

#Preview {
    MyCell(index: 0, imageName: "7AD9C9B8-C9C2-4080-83A9-F66FB004F64F_1_105_c")
        .frame(width: 360, height: 200)
}
