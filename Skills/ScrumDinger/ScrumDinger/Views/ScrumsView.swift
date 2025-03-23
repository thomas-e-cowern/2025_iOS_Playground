//
//  ScrumsView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/22/25.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            } // MARK: - End of list
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    // More to come...
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")

            }
        } // MARK: - End of Navigation
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
