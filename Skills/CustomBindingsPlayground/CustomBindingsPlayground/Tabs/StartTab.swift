//
//  StartTab.swift
//  CustomBindingsPlayground
//
//  Created by Thomas Cowern on 6/18/25.
//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView {
            Tab("Optionals", systemImage: "1.circle") {
                OptionalBindings()
            }
            Tab("NonOptionals", systemImage: "2.circle") {
                NonOptionalExample()
            }
            Tab("ViewModels", systemImage: "3.circle") {
                ViewModelExample()
            }
        }
    }
}

#Preview {
    StartTab()
}

