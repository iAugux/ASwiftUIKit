// Created by Augus on 8/15/25
// Copyright © 2025 Augus <iAugux@gmail.com>

import SwiftUI

@MainActor
@preconcurrency
public struct CompatibleGlassEffectContainer<Content: View>: View {
    private let spacing: CGFloat?
    private let content: () -> Content

    public init(
        spacing: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.spacing = spacing
        self.content = content
    }

    public var body: some View {
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            GlassEffectContainer(spacing: spacing, content: content)
        } else {
            content()
        }
    }
}
