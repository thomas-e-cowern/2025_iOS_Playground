//
//  VegetableRowView.swift
//  GardenApp
//
//  Created by Thomas Cowern on 2/14/25.
//

import SwiftUI

struct VegetableRowView: View {
    
    let vegetable: Vegetable
    
    var body: some View {
        Text(vegetable.name)
    }
}


// Preview using Model sample data extension
#Preview("Extension Data") {
    VegetableRowView(vegetable: Vegetable.sampleVegetable)
}


#Preview("Preview Data") {
    VegetableRowView(vegetable: PreviewData.loadPreviewVegetables()[0])
}
