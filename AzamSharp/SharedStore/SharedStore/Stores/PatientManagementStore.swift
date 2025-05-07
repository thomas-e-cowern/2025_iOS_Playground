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
    
    func allergiesByPatientID(_ id: UUID) async throws -> [Allergy] {
        let allergies: [Allergy] = try await httpClient.load(.allergies(id))
        return allergies
    }
}
