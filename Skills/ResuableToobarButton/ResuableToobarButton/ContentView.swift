//
//  ContentView.swift
//  ResuableToobarButton
//
//  Created by Thomas Cowern on 7/17/25.
//

import SwiftUI
import SwiftData

struct ReusableToolbarButton: View {
    let action: () -> Void
    let imageName: String
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: imageName)
            }
        }
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var thanks: [Thanks]
    @State var showEdit: Bool = false
    @State private var path = NavigationPath()
    @State private var searchText = ""
    @State private var sortOrder = [SortDescriptor(\Thanks.title)]
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ThanksView(searchString: searchText, sortOrder: sortOrder)
                    .navigationDestination(for: Thanks.self, destination: { thanks in
                        EditThanksView(navigationPath: $path, thanks: thanks)
                    })
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                                Picker("Sort", selection: $sortOrder) {
                                    Text("Name (A-Z)")
                                        .tag([SortDescriptor(\Thanks.title)])
                                    
                                    Text("Name (Z-A)")
                                        .tag([SortDescriptor(\Thanks.title, order: .reverse)])
                                }
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            ReusableToolbarButton(action: {
                                print("Save button tapped")
                                let newThanks = Thanks(title: "", body: "", date: Date.now)
                                modelContext.insert(newThanks)
                                path.append(newThanks)
                            }, imageName: "plus")
                        }
                    }
                
            }
        }
    }
}


#Preview {
    ContentView()
}

@Model
class Thanks: Identifiable {
    var id = UUID()
    var title: String
    var reason: String
    var date: Date
    //    var isFavorite: Bool
    //    var icon: String
    //    var color: String
    
    init(title: String, body: String, date: Date) {
        self.title = title
        self.reason = body
        self.date = date
    }
}

extension Thanks {
    static let sampleData: [Thanks] = [
        Thanks(title: "First Thanks", body: "First", date: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date.now),
        Thanks(title: "Second Thanks", body: "Second", date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date.now),
        Thanks(title: "Third Thanks", body: "Third", date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date.now)
    ]
}

struct EditThanksView: View {
    
    @Binding var navigationPath: NavigationPath
    @Environment(\.modelContext) var modelContext
    
    var thanks: Thanks
    
    var body: some View {
        
        @Bindable var thanks = thanks
        
        Form {
            Section {
                TextField("What are you thankful for?", text: $thanks.title)
                
                TextField("Why are you thankful for this?", text: $thanks.reason)
                
                HStack {
                    Text("Mark as favorite")
                    
                }
                
            }
        }
        .onDisappear {
            if thanks.title.isEmpty {
                modelContext.delete(thanks)
            } else {
                do {
                    try modelContext.save()
                } catch {
                    print("Unable to save context: \(error)")
                }
                
            }
            
        }
    }
}
