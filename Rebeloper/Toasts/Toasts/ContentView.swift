//
//  ContentView.swift
//  Toasts
//
//  Created by Thomas Cowern on 4/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.toast) private var toast
    
    var body: some View {
        VStack {
            Button("Present Toast") {
                toast.present(title: "Toast title...", message: "This is the toast message...", icon: AnyView(icon()), actions: AnyView(confirm()), alignment: .bottom, dismissAfter: .seconds(1))
            }
            .buttonStyle(.borderedProminent)
            
            Button("Dismiss Toast") {
                toast.dismiss()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
    
    // MARK: - Methods and functions
    func icon() -> some View {
        Image(systemName: "exclamationmark.arrow.trianglehead.2.clockwise.rotate.90")
            .foregroundStyle(.orange)
    }
    
    func actions() -> some View {
        Button {
            toast.dismiss()
        } label: {
            Text("Dismiss")
        }
        .buttonStyle(.borderedProminent)
    }
    
    func confirm() -> some View {
        Button {
            toast.dismiss()
        } label: {
            Text("Agree")
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
}
