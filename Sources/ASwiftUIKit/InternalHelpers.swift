// Created by Augus on 7/25/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import Foundation

/// Returns `f(x)` if `x` is non-`nil`; otherwise returns `nil`
@discardableResult func given<T, U>(_ x: T?, _ f: (T) -> U?) -> U? { return x != nil ? f(x!) : nil }
