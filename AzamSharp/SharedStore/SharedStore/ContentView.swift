//
//  ContentView.swift
//  SharedStore
//
//  Created by Thomas Cowern on 5/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(PatientManagementStore.self) private var patientManagementStore
    @Environment(AppointmentManagementStore.self) private var appointmentManagementStore
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
                // PatientListView(patients: patientManagementStore.patients)
                //AppointmentListView(appointments: appointmentManagementStore.appointments)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(PatientManagementStore(httpClient: HTTPClient()))
        .environment(AppointmentManagementStore(httpClient: HTTPClient()))
}
