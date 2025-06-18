//
//  NonOptionalExample.swift
//  CustomBindingsPlayground
//
//  Created by Thomas Cowern on 6/18/25.
//

import SwiftUI

struct NonOptionalExample: View {
    @State private var sliderValue: Int = 5
    private var doubleBinding: Binding<Double> {
        Binding {
            Double(sliderValue)
        } set: {
            sliderValue = Int($0)
        }

    }
    var body: some View {
        NavigationStack {
            Text("There other cases where creating your own custom bindings can be really useful, particularly if your underlying models use different Types from what the controls you are using require, like we saw with optionals for a TextField to a String or a DatePicker.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding()
            Form {
                Section("Binding a Slider to an Int") {
                    Slider(value: doubleBinding, in: 1...100, step: 1.0)
                    Text("\(Int(sliderValue))")
                        .font(.system(size: 100))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
            }
            .navigationTitle("Non Optional Example")
        }
    }
}

#Preview {
    NonOptionalExample()
}
