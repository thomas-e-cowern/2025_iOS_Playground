//
//  MenuView.swift
//  SlideMenu
//
//  Created by Thomas Cowern on 3/5/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Menu View")
                Spacer()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background)
    }
}

#Preview {
    MenuView()
}
