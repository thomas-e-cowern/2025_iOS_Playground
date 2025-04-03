import SwiftUI
import UIKit

struct WindowBridgingView<V: View>: UIViewRepresentable {
    var content: V
    
    func makeUIView(context: Context) -> _HelperView {
        return _HelperView(
            content: EnvPassingView(
                content: content,
                environment: context.environment
            )
        )
    }
    func updateUIView(_ helper: _HelperView, context: Context) {
        helper.setContent(
            content: EnvPassingView(
                content: content,
                environment: context.environment
            )
        )
    }
    
    fileprivate struct EnvPassingView: View {
        var content: V
        var environment: EnvironmentValues
        
        var body: some View {
            content.environment(\.self, environment)
        }
    }
    
    final class _HelperView: UIView {
        private var content: EnvPassingView
        
        private var overlayWindow: WindowOverlayWindow?
        private var hostingController: UIHostingController<EnvPassingView>? {
            overlayWindow?.rootViewController as? UIHostingController<EnvPassingView>
        }
        
        fileprivate init(content: EnvPassingView) {
            self.content = content
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) { fatalError() }
        
        override func willMove(toWindow newWindow: UIWindow?) {
            super.willMove(toWindow: newWindow)
            if let windowScene = newWindow?.windowScene {
                overlayWindow = WindowOverlayWindow(windowScene: windowScene)
                updateView()
            }
        }
        
        fileprivate func setContent(
            content: EnvPassingView
        ) {
            self.content = content
            updateView()
        }
        
        private func updateView() {
            if hostingController == nil {
                overlayWindow?.rootViewController = UIHostingController(rootView: content)
                overlayWindow?.rootViewController?.view.backgroundColor = .clear
            } else {
                hostingController?.rootView = content
            }
            overlayWindow?.isHidden = false
        }
    }
}
