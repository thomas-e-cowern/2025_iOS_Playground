//
//  ContentView.swift
//  NavigationFixed
//
//  Created by Thomas Cowern on 12/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @State private var names: [String] = ["Jerry", "Ken", "Diana", "Sophie", "Maria", "Michael", "Sam", "Lila"]
    
    var body: some View {
//        NavigationStack {
//            VStack {
//                List(names, id: \.self) { name in
//                    Button {
//                        isPresented.toggle()
//                    } label: {
//                        Label(name, systemImage: "arrow.right")
//                    }
//                }
//                .linkTarget(isPresented: $isPresented) {
//                    print("Dismissed")
//                } destination: {
//                    Text(name)
//                }
//            }
//        }
//        
        VStack {
            Button {
                isPresented.toggle()
            } label: {
                Label("Navigate", systemImage: "arrow.right")
            }
            .linkTarget(isPresented: $isPresented) {
                print("Dismissed")
            } destination: {
                DestinationView()
            }
        }
        
        .padding()
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}

struct LinkViewModifier<Destination: View>: ViewModifier {
    
    @Binding var isPresented: Bool
    let onDismiss: (() -> Void)?
    @ViewBuilder var destination: () -> Destination
    
    init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, destination: @escaping () -> Destination) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.destination = destination
    }
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(isPresented: $isPresented) {
                destination()
            }
            .onChange(of: isPresented) { _, newValue in
                if !newValue {
                    onDismiss?()
                }
            }
    }
}

extension View {
    func linkTarget<Destination: View>(
        isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder destination: @escaping () -> Destination
    ) -> some View {
        modifier(LinkViewModifier(isPresented: isPresented, onDismiss: onDismiss, destination: destination))
    }
}

