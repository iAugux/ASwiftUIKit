// Created by Augus on 6/17/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI

@available(iOS 14.0, macOS 11.0, *)
public extension LabelStyle where Self == CenteredLabelStyle {
    static var centered: Self {
        .init(spacing: nil)
    }

    static func centered(spacing: CGFloat?) -> Self {
        .init(spacing: spacing)
    }
}

@available(iOS 14.0, macOS 11.0, *)
public struct CenteredLabelStyle: LabelStyle {
    let spacing: CGFloat?

    public func makeBody(configuration: Configuration) -> some View {
        // when spacing is 0, the spacing and fonts will be same as default style except the icon position.
        HStack(spacing: spacing) {
            Label {
                Divider()
                    .opacity(0)
            } icon: {
                configuration.icon
            }
            configuration.title
        }
    }
}
