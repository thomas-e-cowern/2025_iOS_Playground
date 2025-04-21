//
//  FocusedTextFieldIntent.swift
//  AppIntentDemo
//
//  Created by Thomas Cowern on 4/21/25.
//

import AppIntents

struct FocusedTextFieldIntent: AppIntent {
    
    static var title = LocalizedStringResource("Focused Text Field")
    static var description = IntentDescription("Enter your credentials")
    static var openAppWhenRun: Bool = true
    
    @Parameter(title: "Focused Field") var focusedField: String
    
    func perform() async throws -> some IntentResult {
        AppIntentController.shared.focusedField = FocusedField.none
        return .result()
    }
}
