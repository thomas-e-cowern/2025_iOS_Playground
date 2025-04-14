//
//  DoctorScreen.swift
//  TabViewMultipleRouteArray
//
//  Created by Thomas Cowern on 4/14/25.
//
import SwiftUI

struct DoctorScreen: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            Text("Doctor Screen")
            Button("Go to List") {
                router.doctorRoutes.append(.list)
            }
        }
    }
}
