//
//  DestinationListingView.swift
//  iTour
//
//  Created by Thomas Cowern on 10/16/25.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var destinations: [Destination]
    
    init(sort: SortDescriptor<Destination>) {
        _destinations = Query(sort: [sort])
    }
    
    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name))
}
