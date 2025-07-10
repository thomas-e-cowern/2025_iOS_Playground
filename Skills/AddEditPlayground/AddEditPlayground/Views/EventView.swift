//
//  EventView.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/10/25.
//

import SwiftUI
import SwiftData

struct EventView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var events: [Event]
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Event>] = []) {
        _events = Query(filter: #Predicate { event in
            if searchString.isEmpty {
                true
            } else {
                event.name.localizedStandardContains(searchString)
                || event.location.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    var body: some View {
        List {
            ForEach(events) { event in
                NavigationLink {
                    EditEventView(event: event)
                } label: {
                    Text(event.name)
                }

            }
            .onDelete(perform: deleteEvent)
        }
    }
    
    func deleteEvent(at offsets: IndexSet) {
        for offset in offsets {
            let event = events[offset]
            modelContext.delete(event)
            do {
                try modelContext.save()
            } catch {
                print("Unable to delete event: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    EventView()
}
