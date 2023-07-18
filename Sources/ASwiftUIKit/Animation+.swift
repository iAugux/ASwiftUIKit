// Created by Augus on 7/18/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

public extension Animation {
    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}
