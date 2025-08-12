//
//  StepCounterWidget.swift
//  StepCounterWidget
//
//  Created by Thomas Cowern on 8/12/25.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

// UI
// layout
// design
// cleanup

struct StepCounterWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("4,790")
                .font(.system(size: 24, weight: .bold).monospaced())
            Text("steps")
                .font(.system(size: 20).monospaced())
                .foregroundStyle(.secondary)
            
            Spacer()
            
            HStack {
                Image(systemName: "shoeprints.fill")
                Text("176 days!")
            }
            .font(.system(size: 14).monospaced())
            .padding(.bottom, 4)
            
            StepProgressView()
            
        }
        .foregroundStyle(.green)
    }
}

struct StepProgressView: View {
    var body: some View {
        VStack(spacing: 2) {
            HStack(spacing: 3) {
                ForEach(1..<6, id: \.self) { _ in
                    Rectangle()
                        .frame(maxHeight: 5)
                }
            }
            
            HStack(spacing: 3) {
                ForEach(1..<6, id: \.self) { _ in
                    Rectangle()
                        .frame(maxHeight: 5)
                }
            }
            .foregroundStyle(.secondary)
        }
    }
}

struct StepCounterWidget: Widget {
    let kind: String = "StepCounterWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            StepCounterWidgetEntryView(entry: entry)
                .containerBackground(.black, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    StepCounterWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
