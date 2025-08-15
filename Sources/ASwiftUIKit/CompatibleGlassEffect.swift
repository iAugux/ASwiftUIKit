// Created by Augus on 8/1/25
// Copyright © 2025 Augus <iAugux@gmail.com>

import SwiftUI

@available(iOS 14.0, *)
struct CompatibleGlassEffect: ViewModifier {
    func body(content: Content) -> some View {
        content
            .if(true) {
                if #available(iOS 26.0, watchOS 26.0, *) {
                    $0.glassEffect()
                } else {
                    $0
                }
            }
    }
}

@available(iOS 14.0, *)
extension View {
    func compatibleGlassEffect() -> some View {
        self.modifier(CompatibleGlassEffect())
    }
}
