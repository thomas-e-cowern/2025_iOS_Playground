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
                .privacySensitive(.custom(color: .blue, cornerRadius: 12))
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

struct BlurPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) var scenePhase
    
    func body(content: Content) -> some View {
        content
            .blur(radius: (scenePhase != .active) ? 5 : 0)
            .animation(.default, value: scenePhase)
    }
}

struct OpacityPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) var scenePhase
    
    func body(content: Content) -> some View {
        content
            .opacity((scenePhase != .active) ? 0 : 1)
            .animation(.default, value: scenePhase)
    }
}

struct ColorPrivacyViewModifier: ViewModifier {
    
    @Environment(\.scenePhase) var scenePhase
    
    var color: Color
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                color
                    .opacity((scenePhase == .active ? 0 : 1))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    
            }
            .animation(.default, value: scenePhase)
    }
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
                modifier(BlurPrivacyViewModifier())
            case .opacity:
                modifier(OpacityPrivacyViewModifier())
            case .custom(let color, let cornerRadius):
                modifier(ColorPrivacyViewModifier(color: color, cornerRadius: cornerRadius))
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
