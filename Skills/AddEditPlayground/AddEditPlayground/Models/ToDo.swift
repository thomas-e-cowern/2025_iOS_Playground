//
//  ToDo.swift
//  AddEditPlayground
//
//  Created by Thomas Cowern on 7/9/25.
//

import SwiftUI
import SwiftData

@Model
class ToDo: Identifiable {
    var id = UUID()
    var title: String
    var notes: String?
    var isCompleted: Bool
    
    init(title: String, notes: String? = nil, isCompleted: Bool = false) {
        self.title = title
        self.notes = notes
        self.isCompleted = isCompleted
    }
}

extension ToDo {
    static var sampleTodos: [ToDo] {
        [
            .init(title: "Buy milk"),
            .init(title: "Learn SwiftUI"),
            .init(title: "Go for a walk", isCompleted: true),
        ]
    }
}
