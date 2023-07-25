// Created by Augus on 4/2/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import Foundation

@propertyWrapper
struct Clamping<Value: Comparable> {
    var value: Value
    let range: ClosedRange<Value>

    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = range.clamp(wrappedValue)
    }

    var wrappedValue: Value {
        get { value }
        set { value = range.clamp(newValue) }
    }
}

private extension ClosedRange {
    func clamp(_ value : Bound) -> Bound {
        return self.lowerBound > value ? self.lowerBound
        : self.upperBound < value ? self.upperBound
        : value
    }
}
