//
//  ContentViewModel.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/27/25.
//

import Foundation

@Observable
fileprivate class ContentViewModel {
    var profile = Profile()
    
    func chageToThomas() {
        profile.name = "Thomas"
    }
}
