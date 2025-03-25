//
//  NewScrumView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/25/25.
//
import SwiftUI

struct NewScrumView: View {
    
    @State private var newScrum = DailyScrum.emptyScrum
    
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum) { dailyScrum in
                scrums.append(newScrum)
            }
        }
    }
}

#Preview {
    NewScrumView(scrums: .constant(DailyScrum.sampleData))
}
