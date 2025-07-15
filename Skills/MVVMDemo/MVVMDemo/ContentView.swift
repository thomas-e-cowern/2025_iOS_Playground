//
//  ContentView.swift
//  MVVMDemo
//
//  Created by Thomas Cowern on 7/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var personVM = PersonViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(personVM.people) { person in
                    HStack {
                        Text(person.name)
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        VStack {
                            Text(person.email)
                            Text(person.phoneNumber)
                        }
                        .font(.footnote)
                    }
                }
            }
            
            Menu("Options") {
                Button {
                    personVM.reverseOrder()
                } label: {
                    Text("Reverse")
                }
                
                Button {
                    personVM.shuffleOrder()
                } label: {
                    Text("Shuffle")
                }
                
                Button {
                    personVM.removeLasePerson()
                } label: {
                    Text("Remove Last")
                }
                
                Button {
                    personVM.removeFirstPerson()
                } label: {
                    Text("Remove First")
                }
                
                Button {
                    personVM = .init()
                } label: {
                    Text("Back to start")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
