//
//  EditDestinationView.swift
//  iTour
//
//  Created by Thomas Cowern on 10/15/25.
//

import SwiftUI
import SwiftData

private extension String {
    var isBlank: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

struct EditDestinationView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var destination: Destination

    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)

            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle(destination.name.isBlank ? "Add Destination" : "Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            // ✅ Only save if the name is not blank
            if destination.name.isBlank {
                modelContext.delete(destination)
            } else {
                try? modelContext.save()
            }
        }
    }
}



#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        
        let example = Destination(name: "Example Destination", details: "Example details go here and will automatically expand vertically as they are edited.")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
