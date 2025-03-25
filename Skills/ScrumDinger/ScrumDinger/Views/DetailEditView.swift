//
//  DetailEditView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/23/25.
//

import SwiftUI

struct DetailEditView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var scrum: DailyScrum
    
    @State private var newAttendeeName: String = ""
    
    let saveEdits: (DailyScrum) -> Void
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                } // MARK: - End of HStack
                
                ThemePickerView(selection: $scrum.theme)
                
            } header: {
                Text("Meeting Info")
            }  //: End of Section
            
            Section {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }.onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button {
                        withAnimation {
                            let attendee = Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    } // MARK: - End of button
                    .disabled(newAttendeeName.isEmpty)
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
                    saveEdits(scrum)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[1]), saveEdits: { _ in })
}
