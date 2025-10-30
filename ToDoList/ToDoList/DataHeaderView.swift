//
//  DataHeaderView.swift
//  ToDoList
//
//  Created by Thomas Cowern on 10/30/25.
//

import SwiftUI

struct DataHeaderView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                        Text("Hi Tom")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .padding(4)
                        
                        Text("Whats up today?")
                            .font(.caption)
                            .fontWeight(.light)
                            .foregroundStyle(.black)
                            .padding(4)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 0) {
                        // More to come...
                    }
                }
            }
        }
    }
}

#Preview {
    DataHeaderView()
}
