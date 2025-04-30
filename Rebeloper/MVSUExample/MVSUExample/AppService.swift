//
//  AppService.swift
//  MVSUExample
//
//  Created by Thomas Cowern on 4/30/25.
//
import SwiftUI

@Observable
class AppService {
    var profile: Profile = Profile()
    
    func changeName() {
        profile.name = APIUtility.fetchName()
    }
}
