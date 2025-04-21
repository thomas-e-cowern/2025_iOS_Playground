//
//  ShortcutsProvider.swift
//  AppIntentDemo
//
//  Created by Thomas Cowern on 4/21/25.
//

import AppIntents

struct ShortcutsProvider: AppShortcutsProvider {
    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: FocusedTextFieldIntent(),
                    phrases: [
                        "Focus text field in \(.applicationName)",
                        "Enter credentials in \(.applicationName)"
                    ],
                    shortTitle: "Foused Text Field",
                    systemImageName: "pencil.and.ellipsis.rectangle")
    }
}
