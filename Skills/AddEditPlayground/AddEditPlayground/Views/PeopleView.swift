//
//  PeopleView.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/9/25.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var people: [Person]
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Person>] = []) {
        _people = Query(filter: #Predicate { person in
            if searchString.isEmpty {
                true
            } else {
                person.name.localizedStandardContains(searchString)
                || person.emailAddress.localizedStandardContains(searchString)
                || person.details.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        }
    }
    
    func deletePeople(at offsets: IndexSet) {
        for offset in offsets {
            let person = people[offset]
            modelContext.delete(person)
            do {
                try modelContext.save()
            } catch {
                print("Unable to delete people: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    PeopleView()
}
