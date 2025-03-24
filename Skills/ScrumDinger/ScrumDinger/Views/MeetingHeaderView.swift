//
//  MeetingHeaderView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/24/25.
//

import SwiftUI

struct MeetingHeaderView: View {
    var body: some View {
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
    }
}

#Preview() {
    MeetingHeaderView()
}

