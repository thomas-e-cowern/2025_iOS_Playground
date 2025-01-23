//
//  Protocols.swift
//  ErrorAlertPlayground
//
//  Created by Thomas Cowern on 1/23/25.
//

import SwiftUI

protocol AppAlert {
    var title: String { get }
    var subtitle: String? { get }
    var buttons: AnyView { get }
}

