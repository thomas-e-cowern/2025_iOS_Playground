//
//  ContentView.swift
//  TabViewMultipleRouteArray
//
//  Created by Thomas Cowern on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        
        @Bindable var router = router
        
        VStack {
            TabView {
                Tab("Doctor", systemImage: "plus") {
                    NavigationStack(path: $router.doctorRoutes) {
                        DoctorScreen()
                            .navigationDestination(for: DoctorRoutes.self) { route in
                                route.destination
                            }
                    }
                }
                
                Tab("Patient", systemImage: "heart") {
                    NavigationStack(path: $router.patientRoutes) {
                        PatientScreen()
                            .navigationDestination(for: PatientRoutes.self) { route in
                                route.destination
                            }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(Router())
}

// MARK: TODO - Add persistence
// MARK: TODO - update models with more data
// MARK: TODO - add list screen
// MARK: TODO - add details
