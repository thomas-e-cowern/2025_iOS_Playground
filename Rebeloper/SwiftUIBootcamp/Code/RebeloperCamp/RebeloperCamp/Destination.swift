//
//  Destination.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

enum Destination: Hashable, View {
    case view1
    case view2(title: String)
    case view3
    
    var body: some View {
        switch self {
        case .view1:
            MyView1()
        case .view2(let title):
            MyView2(title: title)
        case .view3:
            MyView3()
        }
    }
}
