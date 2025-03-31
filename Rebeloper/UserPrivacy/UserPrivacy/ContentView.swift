//
//  ContentView.swift
//  UserPrivacy
//
//  Created by Thomas Cowern on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .privacySensitive()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct RedactedPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) var scenePhase
    
    func body(content: Content) -> some View {
        content
            .redacted(reason: (scenePhase == .active) ? .init() : .placeholder)
            .animation(.default, value: scenePhase)
    }
}

#Preview {
    Text("Hello, world!")
        .modifier(RedactedPrivacyViewModifier())
}

extension View {
    
    @ViewBuilder
    func privacySensitive(_ style: PrivacySensitiveStyle) -> some View {
        Group {
            switch style {
                case .default:
                privacySensitive()
            case .redacted:
                modifier(RedactedPrivacyViewModifier())
            case .blur:
                modifier(RedactedPrivacyViewModifier())
            case .opacity:
                modifier(RedactedPrivacyViewModifier())
            case .custom(let color, let cornerRadius):
                modifier(RedactedPrivacyViewModifier())
            }
        }
    }
}

enum PrivacySensitiveStyle {
    case `default`
    case redacted
    case blur
    case opacity
    case custom(color: Color, cornerRadius: CGFloat)
}
