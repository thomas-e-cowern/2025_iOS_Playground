//
//  Router.swift
//  TabViewMultipleRouteArray
//
//  Created by Thomas Cowern on 4/14/25.
//

import SwiftUI

class Router {
    
}


enum Route: Hashable {
    case doctor(DoctorRoutes)
    case patient(PatientRoutes)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .doctor(let route):
            route.destination
        case .patient(let route):
            route.destination
        }
    }
}

enum DoctorRoutes: Hashable {
    case list
    case create
    case detail(Doctor)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            Text("Doctor List")
        case .create:
            Text("Create Doctor")
        case .detail(let doctor):
            Text("Doctor Detail: \(doctor.name)")
        }
    }
}

enum PatientRoutes: Hashable {
    case list
    case create
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            Text("Patient List")
        case .create:
            Text("Create Patient")
        }
    }
}
