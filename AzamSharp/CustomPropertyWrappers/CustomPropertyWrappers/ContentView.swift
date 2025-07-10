//
//  ContentView.swift
//  CustomPropertyWrappers
//
//  Created by Thomas Cowern on 7/10/25.
//

import SwiftUI

struct Constants {
    struct RegexPattern {
        static let email = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
    }
}

struct ValidationModifier: ViewModifier {
    
    var errorMessage: String?
    
    func body(content: Content) -> some View {
        VStack(alignment: .center, spacing: 4) {
            content
            
            Text(errorMessage ?? "")
                .font(.caption)
                .foregroundStyle(.red)
                .frame(height: 20)
                .opacity(errorMessage == nil ? 0 : 1)
                .animation(.easeInOut(duration: 0.2), value: errorMessage)
        }
    }
}

extension View {
    func withValidation(_ errorMessage: String?) -> some View {
        self.modifier(ValidationModifier(errorMessage: errorMessage))
    }
}

@propertyWrapper
struct Email {
    
    var errorMessage: String
    private var value: String
    private var isDirty: Bool = false
    var wrappedValue: String
    {
        get { value }
        set {
            value = newValue
            if !newValue.isEmpty {
                isDirty = true
            }
        }
    }
    
    var projectedValue: String? {
        guard isDirty && !wrappedValue.isEmpty else { return nil }
        do {
            // set up the regex expression
            let regex = try NSRegularExpression(pattern: Constants.RegexPattern.email, options: .caseInsensitive)
            
            // set up the range
            let range = NSRange(location: 0, length: wrappedValue.utf16.count)
            
            // check for validity based on regex and range
            let isEmailValid = regex.firstMatch(in: wrappedValue, range: range) != nil
            
            return isEmailValid ? nil : errorMessage
            
        } catch {
            return errorMessage
        }
    }
    
    init(wrappedValue: String, errorMessage: String = "Invalid email format") {
        self.errorMessage = errorMessage
        self.value = wrappedValue
    }
}

struct User {
    @Email(errorMessage: "Email is not in correct format") var email: String = ""
}

struct ContentView: View {
    
    @State private var user = User()
    
    var body: some View {
        VStack {
            TextField("Email", text: $user.email)
                .textFieldStyle(.roundedBorder)
                .withValidation(user.$email)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
