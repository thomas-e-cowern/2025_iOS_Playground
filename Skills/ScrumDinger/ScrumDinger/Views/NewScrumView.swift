//
//  NewScrumView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/25/25.
//
import SwiftUI

struct NewScrumView: View {
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: nil)
        }
    }
}

#Preview {
    NewScrumView()
}
