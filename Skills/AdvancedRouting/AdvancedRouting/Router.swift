//
//  Router.swift
//  AdvancedRouting
//
//  Created by Thomas Cowern on 1/9/26.
//

import SwiftUI

@Observable
final class Router {
    // Navigation state
    var selectedTab: TabDestination?
    var navigationPath: [PushDestination] = []
    var presentedSheet: SheetDestination?

    // Hierarchy management
    weak var parent: Router?
    var isActive = false

    // Navigate to any destination
    func navigate(to destination: Destination) {
        switch destination {
        case .tab(let tab):
            selectTab(tab)
        case .push(let destination):
            push(destination)
        case .sheet(let destination):
            presentSheet(destination)
        }
    }

    func selectTab(_ tab: TabDestination) {
        if let parent {
            // Bubble tab selection to root
            parent.selectTab(tab)
        } else {
            selectedTab = tab
        }
    }

    func push(_ destination: PushDestination) {
        navigationPath.append(destination)
    }

    func presentSheet(_ destination: SheetDestination) {
        presentedSheet = destination
    }
    
    // Create a child router that links back to this router
    func childRouter() -> Router {
        let child = Router()
        child.parent = self
        return child
    }
}

protocol RoutablePush {
    associatedtype V: View
    @ViewBuilder func destinationView() -> V
}

protocol RoutableSheet {
    associatedtype V: View
    @ViewBuilder func destinationView() -> V
}

extension PushDestination: RoutablePush where Self: RoutablePush {}
extension SheetDestination: RoutableSheet where Self: RoutableSheet {}

private extension AnyView {
    init<V: View>(erasing view: V) { self = AnyView(view) }
}

struct NavigationContainer: View {
    @State private var router: Router
    private let content: () -> any View

    init(router: Router, @ViewBuilder content: @escaping () -> some View) {
        self._router = State(initialValue: router)
        self.content = content
    }

    var body: some View {
        @Bindable var bindableRouter = router
        
        NavigationStack(path: $bindableRouter.navigationPath) {
            AnyView(erasing: content())
                .navigationDestination(for: PushDestination.self) { destination in
                    view(for: destination)
                }
        }
        .sheet(item: $bindableRouter.presentedSheet) { destination in
            NavigationContainer(router: router.childRouter()) {
                view(for: destination)
            }
        }
        .environment(router)
        .onAppear { router.isActive = true }
        .onDisappear { router.isActive = false }
    }
    
    @ViewBuilder
    private func view(for destination: PushDestination) -> some View {
        if let routable = destination as? any RoutablePush {
            // Use existential to get the view
            AnyView(erasing: (routable as! RoutablePush).destinationView())
        } else {
            // Fallback empty view if not implemented
            AnyView(EmptyView())
        }
    }

    @ViewBuilder
    private func view(for destination: SheetDestination) -> some View {
        if let routable = destination as? any RoutableSheet {
            AnyView(erasing: (routable as! RoutableSheet).destinationView())
        } else {
            AnyView(EmptyView())
        }
    }
}

