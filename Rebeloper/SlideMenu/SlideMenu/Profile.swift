//
//  Profile.swift
//  SlideMenu
//
//  Created by Thomas Cowern on 3/4/25.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        List {
            ForEach(SampleProfile.sampleProfile) { profile in
                ProfileRow(profile: profile)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    Profile()
}

struct ProfileRow: View {
    
    var profile: SampleProfile
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(profile.name)
                .font(.headline)
            Text(profile.email)
                .font(.caption)
        }
    }
}

