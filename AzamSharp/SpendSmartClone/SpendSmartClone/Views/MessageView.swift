//
//  MessageView.swift
//  SpendSmartClone
//
//  Created by Thomas Cowern on 3/13/25.
//

import SwiftUI

struct MessageView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var messageWrapper: MessageWrapper?
    
    var body: some View {
        VStack {
            if let messageWrapper {
                switch messageWrapper.messageType {
                    case .error(let error):
                        VStack {
                            Text(error.localizedDescription)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }.padding()
                            .background(.red)
                        
                    case .info(let message):
                        Text(message ?? "")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(.orange)
                           
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .padding()
        .foregroundColor(.white)
        .task {
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            messageWrapper = nil
        }
    }
}

#Preview {
    @Previewable @State var message = MessageWrapper(messageType: .info("This is an info message"))
    MessageView(messageWrapper:.constant(message))
}
