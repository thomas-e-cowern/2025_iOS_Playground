//
//  ContentView.swift
//  Hiya
//
//  Created by Thomas Cowern on 11/20/25.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    
    private var largeLanguageModel = SystemLanguageModel.default
    
    @State private var response: String = ""
    
    var body: some View {
        VStack {
            switch largeLanguageModel.availability {
            case .available:
                Text(response)
            case .unavailable(.deviceNotEligible):
                Text("Youre device is not AppleIntelligence capable")
            case .unavailable(.appleIntelligenceNotEnabled):
                Text("Please enable AppleIntelligence in settings")
            case .unavailable(.modelNotReady):
                Text("The AI model is not ready")
            case .unavailable(_):
                Text("The AI feature is not available for an unknown reason")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
