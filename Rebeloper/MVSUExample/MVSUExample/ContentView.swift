//
//  ContentView.swift
//  MVSUExample
//
//  Created by Thomas Cowern on 4/30/25.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var viewModel: ViewModel = ViewModel()
//    @State private var name: String = ""
//    @State private var isEmpty: Bool = true
    @Environment(AppService.self) private var appService
    
    var body: some View {
        
        @Bindable var appService = appService
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
//            if !name.isEmpty {
//                Text("Hello \(appService.profile.name)")
//            } else {
//                Text("Enter your name below")
//            }
            
            Text("Hello \(appService.profile.name)")
            
            Button {
                appService.changeName()
//                isEmpty.toggle()
            } label: {
                Text("Change Name")
            }
            
            Spacer()
                .frame(height: 24)
            
//            TextField("Enter your name", text: $name)
//                .textFieldStyle(.roundedBorder)
//            
//            Button {
//                name = ""
//                isEmpty.toggle()
//            } label: {
//                Text("Clear name")
//            }
//            .disabled(isEmpty)

        }
        .padding()
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ContentView()
        .environment(AppService())
}

//extension ContentView {
//    @Observable
//    class ViewModel {
//        var profile: Profile = Profile()
//        
//        func changeName(name: String) {
//            profile.name = name
//        }
//    }
//}
