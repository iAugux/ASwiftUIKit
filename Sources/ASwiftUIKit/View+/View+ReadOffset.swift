// Created by Augus on 7/25/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

@available(iOS 15.0, macOS 12.0, watchOS 8.0, *)
public extension View {
    func readOffset(_ coordinateSpace: CoordinateSpace = .global, onChange: @escaping (CGFloat) -> Void) -> some View {
        overlay {
            GeometryReader { proxy in
                let minY = proxy.frame(in: coordinateSpace).minY
                Color.clear
                    .preference(key: OffsetKey.self, value: minY)
            }
            .onPreferenceChange(OffsetKey.self, perform: onChange)
        }
    }

    func offset(_ coordinateSpace: CoordinateSpace = .global, offset: Binding<CGFloat>) -> some View {
        overlay {
            GeometryReader { proxy in
                let minY = proxy.frame(in: coordinateSpace).minY
                Color.clear
                    .preference(key: OffsetKey.self, value: minY)
            }
            .onPreferenceChange(OffsetKey.self) { value in
                offset.wrappedValue = value
            }
        }
    }
}

@available(iOS 15.0, macOS 12.0, watchOS 8.0, *)
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
