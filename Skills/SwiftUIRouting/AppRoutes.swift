//
//  AppRoutes.swift
//  SwiftUIRouting
//
//  Created by Thomas Cowern on 6/10/25.
//

import Foundation
import SwiftUI

enum AppRoutes: Routable {
    case home
    case settings
    case changePassword
    case editProfile
    case profile
    case notifications
    case securitySettings

    var body: some View {
        switch self {
        case .home:
            Home()
        case .settings:
            Settings()
        case .changePassword:
            ChangePassword()
        case .editProfile:
            EditProfile()
        case .profile:
            Profile()
        case .notifications:
            Notifications()
        case .securitySettings:
            SecuritySettings()
        }
    }
}
