//
//  EmptyListView.swift
//  MovieList
//
//  Created by Thomas Cowern on 2/26/25.
//
import SwiftUI

struct EmptyListView: View {
    var body: some View {
        ContentUnavailableView {
            Circle()
                .fill(.blue.gradient)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
                .frame(width: 180)
                .overlay {
                    Image(systemName: "movieclapper")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(Color(UIColor.secondarySystemBackground))
                        .padding(.top, -6)
                }
                .padding(.bottom, 90)
        } description: {
            GroupBox {
                TabView {
                    PageTabView(icon: "1.circle", description: "Add some movies to your list to watch at a later date!")
                        .padding(.bottom, 36)
                    
                    PageTabView(icon: "2.circle", description: "Later you can also choose a random movie to watch")
                        .padding(.bottom, 36)
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(minWidth: 0, maxWidth: 560, minHeight: 120, maxHeight: 180)
            }
        }
    }
}

#Preview("Light Mode") {
    EmptyListView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    EmptyListView()
        .preferredColorScheme(.dark)
}
