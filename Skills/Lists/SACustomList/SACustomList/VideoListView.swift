//
//  VideoListView.swift
//  SACustomList
//
//  Created by Thomas Cowern on 2/20/25.
//

import SwiftUI

struct VideoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(videos, id: \.id) { video in
                HStack {
                    Image(video.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .padding(.vertical, 2)
                    
                    VStack(alignment: .leading, spacing: 3.0) {
                        Text(video.title)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text(video.uploadDate)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Sean's Top Ten")
        }
    }
}

#Preview("Light Mode") {
    VideoListView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    VideoListView()
        .preferredColorScheme(.dark)
}
