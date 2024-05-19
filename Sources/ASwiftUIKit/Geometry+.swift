// Created by Augus on 7/10/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

public extension EdgeInsets {
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }

    init(uniform: CGFloat) {
        self.init(horizontal: uniform, vertical: uniform)
    }

    static let zero: EdgeInsets = .init(horizontal: 0, vertical: 0)
}
