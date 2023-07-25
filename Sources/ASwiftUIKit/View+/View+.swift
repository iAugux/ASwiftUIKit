// Created by Augus on 5/19/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

public extension View {
    @inlinable func frame(size: CGSize, alignment: Alignment = .center) -> some View {
        frame(width: size.width, height: size.height, alignment: alignment)
    }

    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
