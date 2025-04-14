//
//  Router.swift
//  TabViewMultipleRouteArray
//
//  Created by Thomas Cowern on 4/14/25.
//

import Foundation

class Router {
    
}


enum Route: Hashable {
    case doctor
    case patient
}

enum DoctorRoutes: Hashable {
    case list
    case create
    case detail(Doctor)
}

enum PatientRoute: Hashable {
    case list
    case create
}
