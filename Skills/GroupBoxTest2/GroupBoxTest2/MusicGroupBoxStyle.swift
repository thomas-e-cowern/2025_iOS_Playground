//
//  MusicGroupBoxStyle.swift
//  GroupBoxTest2
//
//  Created by Thomas Cowern on 5/18/25.
//

import SwiftUI

struct MusicGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .bold()
                .foregroundStyle(.pink)
            configuration.content
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    static var music : MusicGroupBoxStyle { .init() }
}
