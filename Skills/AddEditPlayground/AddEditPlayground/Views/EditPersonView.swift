//
//  EditPersonView.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/9/25.
//

import SwiftUI
import SwiftData

struct EditPersonView: View {
    
    var person: Person
    
    var body: some View {
        
        @Bindable var person = person
        
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)

                TextField("Email address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }

            Section("Notes") {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditPersonView(person: Person(name: "Bill", emailAddress: "bill@bill.com", details: ""))
}
