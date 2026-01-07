//
//  ContentView.swift
//  NavigationFixed
//
//  Created by Thomas Cowern on 12/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
//            Button {
//                isPresented.toggle()
//            } label: {
//                Label("Click here....", systemImage: "house")
//            }
//            .sheet(isPresented: $isPresented) {
//                print("Dismissed")
//            } content: {
//                DestinationView()
//            }
            
            Button {
                isPresented.toggle()
            } label: {
                Label("Navigate", systemImage: "arrow.right")
            }
            .navigationDestination(isPresented: $isPresented) {
                DestinationView()
            }
            .onChange(of: isPresented) { _, newValue in
                if !isPresented {
                    print("Dismissed")
                }
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
                if !isPresented {
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
