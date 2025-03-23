//
//  ThemeView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/23/25.
//

import SwiftUI

struct ThemeView: View {
    
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding()
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .bubblegum)
}
