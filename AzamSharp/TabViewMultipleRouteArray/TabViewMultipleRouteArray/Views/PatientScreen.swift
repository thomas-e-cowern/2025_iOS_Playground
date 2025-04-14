//
//  PatientScreen.swift
//  TabViewMultipleRouteArray
//
//  Created by Thomas Cowern on 4/14/25.
//
import SwiftUI

struct PatientScreen: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            Text("Patient Screen")
            Button("Go to create scree") {
                router.patientRoutes.append(.create)
            }
        }
    }
}

