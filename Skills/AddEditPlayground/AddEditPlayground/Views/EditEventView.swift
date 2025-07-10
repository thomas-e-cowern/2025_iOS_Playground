//
//  EditEventView.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/10/25.
//

import SwiftUI

struct EditEventView: View {
    
    @Bindable var event: Event
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Form {
            Section("Name of event") {
                TextField("Name of event", text: $event.name)
            }
            Section("Location") {
                TextField("Location", text: $event.location)
            }
            
        }
        .navigationTitle(event.name == "" ? "Add Event" : "Edit Event")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear() {
            if event.name.isEmpty {
                modelContext.delete(event)
            }
        }
    }
}

#Preview {
    EditEventView(event: Event(name: "1909 World Series", location: "WPB"))
}
