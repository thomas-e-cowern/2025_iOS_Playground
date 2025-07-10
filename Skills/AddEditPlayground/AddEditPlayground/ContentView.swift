//
//  ContentView.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = [SortDescriptor(\Person.name)]
    @State private var path = NavigationPath()
    @State private var showEventsList: Bool = false
    @Query var people: [Person]
    @Query var events: [Event]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
           PeopleView(searchString: searchText, sortOrder: sortOrder)
            .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self) { person in
                EditPersonView(navigationPath: $path, person: person)
            }
            .navigationDestination(isPresented: $showEventsList, destination: {
                ListEventsView(events: events)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showEventsList.toggle()
                    } label: {
                        Text("Show Events")
                    }

                }
               
                ToolbarItem {
                    Button("Add Person", systemImage: "plus", action: addPerson)
                }
                
                ToolbarItem {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name (A-Z)")
                                .tag([SortDescriptor(\Person.name)])

                            Text("Name (Z-A)")
                                .tag([SortDescriptor(\Person.name, order: .reverse)])
                        }
                    }
                }
                
            }
            .overlay {
                if people.isEmpty {
                    ContentUnavailableView("You don't have any people yet!", systemImage: "person", description: Text("Add a person to begin the list!"))
                }
            }
            .searchable(text: $searchText)
        }
    }
    
    func addPerson() {
        let person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Person.self, inMemory: true)
}

#Preview("With Data") {
    ContentView()
        .modelContainer(for: Person.self, inMemory: true)
}
