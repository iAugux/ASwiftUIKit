// Created by Augus on 7/29/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

public struct Stack<Content> : View where Content : View {
    let axis: Axis
    let verticalAlignment: VerticalAlignment
    let horizontalAlignment: HorizontalAlignment
    let spacing: CGFloat?
    @ViewBuilder let content: () -> Content

    public init(axis: Axis, verticalAlignment: VerticalAlignment = .center, horizontalAlignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.axis = axis
        self.verticalAlignment = verticalAlignment
        self.horizontalAlignment = horizontalAlignment
        self.spacing = spacing
        self.content = content
    }

    public enum Axis {
        case horizontal
        case vertical
    }

    public var body: some View {
        switch axis {
        case .horizontal:
            HStack(alignment: verticalAlignment, spacing: spacing, content: content)
        case .vertical:
            VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
        }
    }
}
