//
//  DetailView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/22/25.
//

import SwiftUI

struct DetailView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Information")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    
                    Spacer()
                    
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }  // MARK: - End of Section
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        } // MARK: - End of list
        .navigationTitle(scrum.title)
    }
}

#Preview {
    NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[1])
    }
}
