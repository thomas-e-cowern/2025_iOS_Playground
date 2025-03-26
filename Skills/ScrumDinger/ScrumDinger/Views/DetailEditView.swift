//
//  DetailEditView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/23/25.
//

import SwiftUI
//import ThemeKit
import SwiftData

struct DetailEditView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    let scrum: DailyScrum
    
    @State private var attendeeName = ""
    @State private var title: String
    @State private var lengthInMinutesAsDouble: Double
    @State private var attendees: [Attendee]
    @State private var theme: Theme
    
    private let isCreatingScrum: Bool
    
    init(scrum: DailyScrum?) {
            let scrumToEdit: DailyScrum
            if let scrum {
                scrumToEdit = scrum
                isCreatingScrum = false
            } else {
                scrumToEdit = DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
                isCreatingScrum = true
            }


            self.scrum = scrumToEdit
            self.title = scrumToEdit.title
            self.lengthInMinutesAsDouble = scrumToEdit.lengthInMinutesAsDouble
            self.attendees = scrumToEdit.attendees
            self.theme = scrumToEdit.theme
        }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                HStack {
                    Slider(value: $lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(String(format: "%.0f", lengthInMinutesAsDouble)) minutes")
                    
                    Spacer()
                    
                    Text("\(String(format: "%.0f", lengthInMinutesAsDouble)) minutes")
                        .accessibilityHidden(true)
                } // MARK: - End of HStack
                
                ThemePickerView(selection: $theme)
                
            } header: {
                Text("Meeting Info")
            }  //: End of Section
            
            Section {
                ForEach(attendees) { attendee in
                    Text(attendee.name)
                }.onDelete { indices in
                    attendees.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button {
                        withAnimation {
                            let attendee = Attendee(name: attendeeName)
                            attendees.append(attendee)
                            attendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    } // MARK: - End of button
                    .disabled(attendeeName.isEmpty)
                } // MARK: - End of HStack
            } header: {
                Text("Attendees")
            }  // MARK: - End of Section

        } // MARK: - End of form
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    saveEdits()
                    dismiss()
                }
            }
        }
    }
    
    // MARK: - Methods and functions
    private func saveEdits() {
            scrum.title = title
            scrum.lengthInMinutesAsDouble = lengthInMinutesAsDouble
            scrum.attendees = attendees
            scrum.theme = theme


            if isCreatingScrum {
                context.insert(scrum)
            }


            try? context.save()
        }
}

#Preview(traits: .dailyScrumsSampleData) {
    @Previewable @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]
    DetailEditView(scrum: scrums.first!)
}
