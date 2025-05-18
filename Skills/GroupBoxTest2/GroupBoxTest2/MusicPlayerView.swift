//
//  MusicPlayerView.swift
//  GroupBoxTest2
//
//  Created by Thomas Cowern on 5/18/25.
//
import SwiftUI

struct MusicPlayerView: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.secondary)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Into The Mystic")
                        .font(.headline.bold())
                    
                    Text("Van Morrison")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
            }
            .padding(.bottom, 8)
            
            ProgressView(value: 0.5, total: 1)
                .tint(.secondary)
                .padding(.bottom, 8)
            
            HStack(spacing: 8) {
                Image(systemName: "backward.fill")
                Image(systemName: "pause.fill")
                Image(systemName: "forward.fill")
            }
            .foregroundStyle(.secondary)
            .font(.title)
        }
    }
}

#Preview {
    MusicPlayerView()
}
