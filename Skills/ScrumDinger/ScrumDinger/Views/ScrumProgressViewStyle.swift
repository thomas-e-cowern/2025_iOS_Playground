//
//  ScrumProgressViewStyle.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/24/25.
//
import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    var theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
            if #available(iOS 15.0, *) {
                ProgressView(configuration)
                    .tint(theme.mainColor)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            } else {
                ProgressView(configuration)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProgressView(value: 4.0)
        .progressViewStyle(ScrumProgressViewStyle(theme: .bubblegum))
    
}
