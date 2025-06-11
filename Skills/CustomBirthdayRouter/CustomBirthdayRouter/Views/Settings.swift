//
//  Settings.swift
//  CustomBirthdayRouter
//
//  Created by Thomas Cowern on 6/11/25.
//

import SwiftUI

struct Settings: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "gear")
                Text("Settings")
            }
            
            Button {
                router.navigateTo(route: .favorites)
            } label: {
                Text("Go to Favorites")
            }

        }
    }
}

#Preview {
    Settings()
        .withRouter()
}
