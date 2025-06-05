//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Thomas Cowern on 6/5/25.
//
import SwiftUI

struct CustomTabBar: View {
    
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button {
                self.index = 0
            } label: {
                Image(systemName: "house")
            }
            .foregroundStyle(Color.blue.opacity(self.index == 0 ? 1 : 0.2))
            
            Spacer(minLength: 0)
            
            Button {
                self.index = 1
            } label: {
                Image(systemName: "magnifyingglass")
            }
            .foregroundStyle(Color.blue.opacity(self.index == 1 ? 1 : 0.2))
            
            Spacer(minLength: 0)
            
            Button {
                // More to come...
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70)
                    Circle()
                        .frame(width: 50)
                    Image(systemName: "plus")
                        .foregroundStyle(Color.white)
                        .font(.largeTitle)
                }
            }
            .offset(y: -25)

            Spacer()
            
            Button {
                self.index = 2
            } label: {
                Image(systemName: "heart")
            }
            .foregroundStyle(Color.blue.opacity(self.index == 2 ? 1 : 0.2))
            
            Spacer(minLength: 0)
            
            Button {
                self.index = 3
            } label: {
                Image(systemName: "person")
            }
            .foregroundStyle(Color.blue.opacity(self.index == 3 ? 1 : 0.2))

        }
        .padding(.horizontal, 35)
        .background(Color.white)
        .offset(y: 12)
    }
}
