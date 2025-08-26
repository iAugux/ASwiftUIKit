// Created by Augus on 7/25/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

public extension View {
    func readFrame(_ coordinateSpace: CoordinateSpace = .global, onChange: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: FramePreferenceKey.self, value: geometryProxy.frame(in: coordinateSpace))
            }
        )
        .onPreferenceChange(FramePreferenceKey.self, perform: { frame in
            DispatchQueue.main.async {
                onChange(frame)
            }
        })
    }
}

private struct FramePreferenceKey: PreferenceKey {
    static let defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}
