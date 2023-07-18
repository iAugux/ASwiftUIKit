// Created by Augus on 7/12/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

public struct NoDisclosureIndicatorNavigationLink<Label, Destination> : View where Label : View, Destination : View {
    let destination: () -> Destination
    var label: (() -> Label)?
    var text: Text?

    public init(@ViewBuilder destination: @escaping () -> Destination, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.destination = destination
    }

    public init(_ titleKey: LocalizedStringKey, @ViewBuilder destination: @escaping () -> Destination) {
        self.text = Text(titleKey)
        self.destination = destination
    }

    public init<S>(_ title: S, @ViewBuilder destination: @escaping () -> Destination) where S : StringProtocol {
        self.text = Text(title)
        self.destination = destination
    }

    public var body: some View {
        ZStack {
            _label()
            NavigationLink {
                destination()
            } label: {
                _label() // this is just for accessibility (maybe)
            }
            .opacity(0)
        }
    }

    @ViewBuilder
    private func _label() -> some View {
        if let text {
            text
        } else if let label {
            label()
        }
    }
}
