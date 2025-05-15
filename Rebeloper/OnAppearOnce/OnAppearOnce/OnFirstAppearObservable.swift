//
//  OnFirstAppearObservable.swift
//  OnAppearOnce
//
//  Created by Thomas Cowern on 5/15/25.
//

import SwiftUI
import Observation

@Observable
class OnFirstAppearObservable {
    var destinationViewFirstAppear: Bool = false
    
    func destinationViewAction(action: () -> Void) {
        if !destinationViewFirstAppear {
            destinationViewFirstAppear = true
            action()
        }
    }
}
