//
//  MeetingView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/22/25.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 17, total: 50)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            } // MARK: - End of HStack
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button {
                    // More to come
                } label: {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")

            }
        } //: End of VStack
        .padding()
    }
}

#Preview {
    MeetingView()
}
