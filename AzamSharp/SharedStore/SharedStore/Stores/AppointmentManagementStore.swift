//
//  AppointmentManagementStore.swift
//  SharedStore
//
//  Created by Thomas Cowern on 5/9/25.
//
import Foundation
import Observation

@Observable
class AppointmentManagementStore {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func scheduleAppointment(_ patient: Patient) async throws {
        // More to come...
    }
}
