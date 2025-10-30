//
//  DataHeaderView.swift
//  ToDoList
//
//  Created by Thomas Cowern on 10/30/25.
//

import SwiftUI

struct DataHeaderView: View {
    fileprivate func nameHeaderTextView() -> HStack<TupleView<(VStack<TupleView<(some View, some View)>>, Spacer, VStack<TupleView<(Text, Button<some View>)>>)>> {
        return HStack {
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
                Text("dataManager.selectedDate.monthToString()")
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                
                Button {
                    // More to come...
                } label: {
                    Text("Today")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(4)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                nameHeaderTextView()
            }
        }
    }
}

#Preview {
    DataHeaderView()
}
