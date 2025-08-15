// Created by Augus on 8/1/25
// Copyright © 2025 Augus <iAugux@gmail.com>

import SwiftUI

struct CompatibleGlassEffect: ViewModifier {
    func body(content: Content) -> some View {
        content
            .if(true) {
                if #available(watchOS 26.0, *) {
                    $0.glassEffect()
                } else {
                    $0
                }
            }
    }
}

extension View {
    func compatibleGlassEffect() -> some View {
        self.modifier(CompatibleGlassEffect())
    }
}
