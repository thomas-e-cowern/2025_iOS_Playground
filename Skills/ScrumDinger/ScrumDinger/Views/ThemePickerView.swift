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
            
        }
    }
}

#Preview {
    ThemePickerView(selection: .constant(.bubblegum))
}
