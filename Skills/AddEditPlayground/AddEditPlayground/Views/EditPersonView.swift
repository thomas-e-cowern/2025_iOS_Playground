//
//  EditPersonView.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/9/25.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    
    @Environment(\.modelContext) var modelContext
    @Binding var navigationPath: NavigationPath
    
    var person: Person
    
    @Query(sort: [
        SortDescriptor(\Event.name),
        SortDescriptor(\Event.location)
    ]) var events: [Event]
    
    var body: some View {
        
        @Bindable var person = person
        
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)

                TextField("Email address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Section("Where did you meet them?") {
                Picker("Met at", selection: $person.metAt) {
                    Text("Unknown event")
                        .tag(Optional<Event>.none)
                    if events.isEmpty == false {
                        Divider()

                        ForEach(events) { event in
                            Text(event.name)
                                .tag(event)
                        }
                    }
                }

                Button("Add a new event", action: addEvent)
            }

            Section("Notes") {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Event.self) { event in
            EditEventView(event: event)
        }
        .onDisappear() {
            if person.name.isEmpty {
                modelContext.delete(person)
            }
        }
    }
    
    func addEvent() {
        let event = Event(name: "", location: "")
        modelContext.insert(event)
        navigationPath.append(event)
    }
}

#Preview {
    
    EditPersonView(navigationPath: .constant(NavigationPath()), person: Person(name: "Bill", emailAddress: "bill@bill.com", details: ""))
}
