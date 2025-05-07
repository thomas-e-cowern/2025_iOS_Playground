//
//  PatientManagementStore.swift
//  SharedStore
//
//  Created by Thomas Cowern on 5/7/25.
//
import Foundation
import Observation

@Observable
class PatientManagementStore {
    let httpClient: HTTPClient
    var patients: [Patient] = []
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadPatients() async throws {
        patients = try await httpClient.load(.patients)
    }
    
    func patientByID(_ id: UUID) -> Patient? {
        return nil
    }
}
