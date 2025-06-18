//
//  ViewModel.swift
//  CustomBindingsPlayground
//
//  Created by Thomas Cowern on 6/18/25.
//

import SwiftUI

@Observable
class ViewModel {
    var firstName: String
    var middleName: String?
    var lastName: String
    
    var middleBinding: Binding<String> {
        Binding(
            get: { self.middleName ?? "" },
            set: { self.middleName = $0.isEmpty ? nil : $0 }
        )
    }
    
    init(firstName: String, middleName: String? = nil, lastName: String) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
    }
}
