//
//  CapsuleRowView.swift
//  SpaceXTest
//
//  Created by Thomas Cowern on 10/3/25.
//

import SwiftUI

struct CapsuleRowView: View {
    
    var capsule: Capsule
    
    var body: some View {
        HStack() {
            Text("\(capsule.serial): ")
            Text(capsule.type)
            Spacer()
        }
        .padding()
        .font(.headline)
    }
}

#Preview {
    CapsuleRowView(capsule: DataViewModel.init().capsules.first!)
}
