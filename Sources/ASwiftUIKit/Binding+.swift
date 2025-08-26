// Created by Augus on 5/27/24
// Copyright © 2024 Augus <iAugux@gmail.com>

import SwiftUI

public extension Binding {
    /// Turn `Binding<T?>` into a `Binding<T>?`
    func unwrap<T: Sendable>() -> Binding<T>? where T? == Value {
        guard let value = wrappedValue else { return nil }
        return Binding<T> {
            value
        } set: {
            wrappedValue = $0
        }
    }
}

public extension Optional {
    /// Turn `Binding<T>?` into a `Binding<T?>`
    func wrap<T>() -> Binding<T?> where Wrapped == Binding<T> {
        if let binding = self {
            return Binding(binding)
        } else {
            return .constant(nil)
        }
    }
}

