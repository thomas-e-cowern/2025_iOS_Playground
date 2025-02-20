//
//  VideoDetailView.swift
//  SACustomList
//
//  Created by Thomas Cowern on 2/20/25.
//

import SwiftUI

struct VideoDetailView: View {
    
    var video: Video
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 3)
            
            HStack(spacing: 40) {
                Label("\(video.viewCount)", systemImage: "eye")
                Label(video.uploadDate, systemImage: "calendar")
            }
            .font(.subheadline)
            .foregroundStyle(Color.secondary)
            
            Text(video.description)
                .padding()
            
            Spacer()
            
            Link(destination: video.url) {
                Text("Watch Now")
                    .bold()
                    .font(.title2)
                    .frame(width: 200, height: 50)
                    .background(Color(.systemRed))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }

        }
    }
}

#Preview("Light Mode") {
    VideoDetailView(video: VideoList.topTen[2])
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    VideoDetailView(video: VideoList.topTen[2])
        .preferredColorScheme(.dark)
}
