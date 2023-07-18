// Created by Augus on 7/18/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

public extension Shape {
    @ViewBuilder
    func compatibleGradient(_ color: Color) -> some View {
        if #available(iOS 16.0, macOS 13.0, watchOS 9.0, *) {
            self.fill(color.gradient)
        } else {
            fill(LinearGradient(gradient: .init(colors: [color.opacity(0.6), color]), startPoint: .top, endPoint: .bottom))
        }
    }
}
