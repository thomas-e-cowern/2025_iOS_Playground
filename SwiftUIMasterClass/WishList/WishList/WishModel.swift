//
//  WishModel.swift
//  WishList
//
//  Created by Thomas Cowern on 2/6/25.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
