//
//  DetailEditView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/23/25.
//

import SwiftUI

struct DetailEditView: View {
    
    @State private var scrum = DailyScrum.emptyScrum
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $scrum.title)
            } header: {
                Text("Meeting Info")
            }
        }
    }
}

#Preview {
    DetailEditView()
}
