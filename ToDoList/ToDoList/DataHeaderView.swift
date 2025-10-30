//
//  DataHeaderView.swift
//  ToDoList
//
//  Created by Thomas Cowern on 10/30/25.
//

import SwiftUI


struct DataHeaderView: View {
    
    @Environment(DateManager.self) var dateManager
    
    var body: some View {
        ZStack {
            VStack {
                nameHeaderTextView()
            }
        }
    }
    
    @ViewBuilder
    private func nameHeaderTextView() -> HStack<TupleView<(VStack<TupleView<(some View, some View)>>, Spacer, VStack<TupleView<(Text, Button<some View>)>>)>> {
        HStack {
            VStack(alignment: .listRowSeparatorLeading, spacing: 0) {
                Text("Hi Tom")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(4)
                
                Text(dateManager.selectedDate == Calendar.current.startOfDay(for: Date()) ? "Whats up today?" : "Planning for the future")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(.black)
                    .padding(4)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 10) {
                Text(dateManager.selectedDate == Calendar.current.startOfDay(for: Date()) ? "Whats up today?" : "Planning for the future")
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                
                Button {
                    withAnimation(.linear(duration: 0.2)) {
                        dateManager.selectToday()
                    }
                    
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
}

#Preview {
    DataHeaderView()
        .environment(DateManager())
}
