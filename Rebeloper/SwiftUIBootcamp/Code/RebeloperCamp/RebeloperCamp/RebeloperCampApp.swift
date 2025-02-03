//
//  RebeloperCampApp.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/26/25.
//

import SwiftUI

@main
struct RebeloperCampApp: App {
    
    //    @State private var appController = AppController()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .green
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some Scene {
        WindowGroup {
            //            NavigationStack {
            //                ProfilesView()
            //                    .environment(appController)
            //            }
            NavRoot()
        }
    }
}
