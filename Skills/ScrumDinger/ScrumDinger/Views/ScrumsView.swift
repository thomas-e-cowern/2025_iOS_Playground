//
//  ScrumsView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/22/25.
//

import SwiftUI
import SwiftData

struct ScrumsView: View {
    
    @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView: Bool = false
    
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            } // MARK: - End of list
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button {
                    isPresentingNewScrumView = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")

            }
        } // MARK: - End of Navigation
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumView()
        }
    }
}

#Preview(traits: .dailyScrumsSampleData) {
    ScrumsView()
}
