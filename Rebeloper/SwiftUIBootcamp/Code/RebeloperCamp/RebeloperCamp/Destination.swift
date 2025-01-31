//
//  Destination.swift
//  RebeloperCamp
//
//  Created by Thomas Cowern on 1/31/25.
//

import SwiftUI

enum Destination: Hashable, View {
    case view1
    case view2
    case view3
    
    var body: some View {
        switch self {
        case .view1:
            MyView1()
        case .view2:
            MyView2()
        case .view3:
            MyView3()
        }
    }
}
