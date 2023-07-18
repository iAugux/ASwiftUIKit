// Created by Augus on 6/9/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

public extension ButtonStyle where Self == NoneEffectButtonStyle {
    static var none: Self {
        .init()
    }
}

public struct NoneEffectButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
