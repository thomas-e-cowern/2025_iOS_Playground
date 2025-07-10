//
//  ListEventsView.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/10/25.
//

import SwiftUI

struct ListEventsView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var searchText = ""
    @State private var sortOrder = [SortDescriptor(\Event.name)]
    @State private var showEditEvent: Bool = false
    var events: [Event]
    
    var body: some View {
        VStack {
            EventView(searchString: searchText, sortOrder: sortOrder)
            
        }
        .navigationTitle("Event List")
        .overlay {
            if events.isEmpty {
                ContentUnavailableView("You don't have any events yet!", systemImage: "list.clipboard", description: Text("Add an event to begin the list!"))
            }
        }
    }
}

#Preview {
    ListEventsView(events: [Event(name: "First Event", location: "Home"), Event(name: "Second Event", location: "School")])
}
