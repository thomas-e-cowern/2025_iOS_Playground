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
            TextField("Name of event", text: $event.name)
            TextField("Location", text: $event.location)
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
