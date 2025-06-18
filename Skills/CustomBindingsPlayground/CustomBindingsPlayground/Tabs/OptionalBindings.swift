//
//  OptionalBindings.swift
//  CustomBindingsPlayground
//
//  Created by Thomas Cowern on 6/18/25.
//

import SwiftUI

struct OptionalBindings: View {
    @State private var name: String?
    @State private var age: Int = 0
    @State private var selectedDate: Date = Date.now
    var body: some View {
        NavigationStack {
            Text("TextFields can only be bound to non-optional strings or optional other Types when using the format option.  If the bound values are optional, a custom binding must be used.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding()
            Form {
                Section("Optional String TextField") {
                    TextField( "Enter Name",
                               text: Binding(
                                // The best way
                                get: { name ?? "" }, set: { name = $0.isEmpty ? "nil" : $0 }
                                // the shorter way
//                                set: { entry in
//                                    name = entry.isEmpty ? "nil" : entry
//                                }
                                // The long way
//                                set: { entry in
//                                    if entry.isEmpty {
//                                        name = nil
//                                    } else {
//                                       name = entry
//                                    }
//                                }
                               )
                    )
                    Text(name ?? "nil")
                        .valueDisplay()
                }
                Section("Optional Numeric TextField") {
                    TextField( "Enter Age", value: $age, format: .number)
                    Text("\(age)")
                        .valueDisplay()
                }
                Section("Optional Dates") {
                    DatePicker("Select Date", selection: $selectedDate,
                               displayedComponents: .date)
                }
            }
            
            .navigationTitle("Optional Bindings")
        }
    }
}

#Preview {
    OptionalBindings()
}
