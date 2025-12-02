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
    private var session = LanguageModelSession()
    
    @State private var response: String = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            switch largeLanguageModel.availability {
            case .available:
                if response.isEmpty {
                    Text("Tap the button to get a fun response.")
                        .foregroundStyle(.tertiary)
                        .multilineTextAlignment(.center)
                        .font(.title)
                } else {
                    Text(response)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                }
            case .unavailable(.deviceNotEligible):
                Text("Youre device is not AppleIntelligence capable")
            case .unavailable(.appleIntelligenceNotEnabled):
                Text("Please enable AppleIntelligence in settings")
            case .unavailable(.modelNotReady):
                Text("The AI model is not ready")
            case .unavailable(_):
                Text("The AI feature is not available for an unknown reason")
            }
            
            Spacer()
            
            Button {
                Task {
                    let prompt = "Say hi in a fun way"
                    
                    do {
                        let reply = try await session.respond(to: prompt)
                        response = reply.content
                    } catch {
                        response = "Failed to get response: \(error.localizedDescription)"
                    }
                }
            } label: {
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .buttonSizing(.flexible)
            .glassEffect(.regular.interactive())

        }
        .padding()
        .tint(.purple)
    }
}

#Preview {
    ContentView()
}
