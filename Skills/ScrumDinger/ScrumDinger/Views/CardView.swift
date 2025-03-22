//
//  CardView.swift
//  ScrumDinger
//
//  Created by Thomas Cowern on 3/22/25.
//

import SwiftUI

struct CardView: View {
    
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            } // MARK: - End of HStack
            .font(.caption)
        } //: End of VStack
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
    }
}

#Preview("Light", traits: .fixedLayout(width: 400, height: 60)) {
    
    var scrum = DailyScrum.sampleData[0]
    
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
        .preferredColorScheme(.light)
}

#Preview("Dark", traits: .fixedLayout(width: 400, height: 60)) {
    
    var scrum = DailyScrum.sampleData[0]
    
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
        .preferredColorScheme(.dark)

}
