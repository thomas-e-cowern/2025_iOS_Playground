//
//  NoteCellView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 3/6/25.
//

import SwiftUI

struct NoteCellView: View {
    
    let note: Note
    let placeholderImage: URL?
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(colors: [Color.green.opacity(0.3)],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing
                                      )
                    )
                    .frame(width: 85, height: 85)
                    .shadow(color: Color.black.opacity(0.1), radius: 6)
                
                if let photoData = note.photo, let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                } else {
                    AsyncImage(url: placeholderImage) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .foregroundStyle(.gray)
                            .shadow(color: Color.black.opacity(0.2), radius: 4)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .foregroundStyle(.gray)
                            .shadow(color: Color.black.opacity(0.2), radius: 4)
                    } // End of placeholder
                } //: End of if else
            } //: End of ZStack
            
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(note.body)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                Text(note.dateCreated, format: .dateTime)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    NoteCellView(note: Note(title: "New note", body: "This is a new note body that could be longer"), placeholderImage: PreviewData.loadPreviewVegetables()[9].imageUrl)
}
