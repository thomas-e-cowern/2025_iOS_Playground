import SwiftUI

extension View {
    func windowOverlay<V: View>(@ViewBuilder content: () -> V) -> some View {
        self.background {
            WindowBridgingView(content: content())
                .allowsHitTesting(false)
        }
    }
}
