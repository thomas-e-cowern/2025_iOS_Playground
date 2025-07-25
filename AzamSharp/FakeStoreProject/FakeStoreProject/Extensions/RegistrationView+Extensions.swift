//
//  RegistrationView+Extensions.swift
//  FakeStoreProject
//
//  Created by Thomas Cowern on 7/23/25.
//

import SwiftUI

extension RegistrationView {
    struct RegistrationForm {
        var name: String = ""
        var email: String = ""
        var password: String = ""
        
        var isValid: Bool {
            validate().isEmpty
        }
        
        func validate() -> [String] {
            var errors: [String] = []
            
            if name.isEmptyOrWhitespace {
                errors.append("Name cannot be emtpy.")
            }
            
            if email.isEmptyOrWhitespace {
                errors.append("Email cannot be emtpy.")
            }
            
            if !password.isValidPassword{
                errors.append("Password must be at least 8 characters long.")
            }
            
            if !email.isValidEmail {
                errors.append("Please enter a valid email address.")
            }
            
            return errors
        }
    }
}
