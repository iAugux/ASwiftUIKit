// Created by Augus on 7/25/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

#if os(iOS)
// MARK: - Blur Effect View
public struct BlurEffectView: UIViewRepresentable {
    private let style: UIBlurEffect.Style?

    public init(style: UIBlurEffect.Style? = nil) {
        self.style = style
    }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView(effect: given(style) { UIBlurEffect(style: $0) })
    }

    public func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = given(style) { UIBlurEffect(style: $0) }
    }
}
#endif
