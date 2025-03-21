//
//  UnitTestingPlaygroundViewModel.swift
//  UnitTestingPlayground
//
//  Created by Thomas Cowern on 3/18/25.
//

import Foundation

class UnitTestingPlaygroundViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem: String? = nil
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
    
    func addItem(item: String) {
        guard !item.isEmpty else { return }
        self.dataArray.append(item)
    }
    
    func selectItem(item: String) {
        if let chosenItem = dataArray.first(where: { $0 == item }) {
            selectedItem = chosenItem
        }
    }
}
