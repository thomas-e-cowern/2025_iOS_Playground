//
//  ThemePickerView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/23/25.
//

import SwiftUI

struct ThemePickerView: View {
    
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePickerView(selection: .constant(.bubblegum))
}
