//
//  ListEventsView.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/10/25.
//

import SwiftUI

struct ListEventsView: View {
    
    @Environment(\.modelContext) var modelContext
    
    var events: [Event]
    
    var body: some View {
        List {
            ForEach(events, id: \.self) { event in
                Text(event.name)
            }
            .onDelete(perform: deleteEvent)
        }
        .navigationTitle("Event List")
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
    ListEventsView(events: [Event(name: "1909 Party", location: "Clematis"), Event(name: "Superbowl", location: "O'Sheas")])
}
