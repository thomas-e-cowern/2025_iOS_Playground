//
//  StepCounterWidgetBundle.swift
//  StepCounterWidget
//
//  Created by Thomas Cowern on 8/12/25.
//

import WidgetKit
import SwiftUI

@main
struct StepCounterWidgetBundle: WidgetBundle {
    var body: some Widget {
        StepCounterWidget()
        StepCounterWidgetControl()
        StepCounterWidgetLiveActivity()
    }
}
