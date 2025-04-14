//
//  ContentView.swift
//  TabViewMultipleRouteArray
//
//  Created by Thomas Cowern on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                Tab("Doctor", systemImage: "plus") {
                    DoctorScreen()
                }
                
                Tab("Patient", systemImage: "heart") {
                    PatientScreen()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
