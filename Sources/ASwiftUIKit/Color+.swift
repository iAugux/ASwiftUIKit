// Created by Augus on 7/5/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI
#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

#if os(macOS)
typealias PlatformColor = NSColor
#elseif os(iOS) || os(watchOS)
typealias PlatformColor = UIColor
#endif
public extension PlatformColor {
    var color: Color {
        return Color(self)
    }
}

public extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 08) & 0xFF) / 255,
            blue: Double((hex >> 00) & 0xFF) / 255,
            opacity: alpha
        )
    }

    static var random: Color {
        return Color(red: .random(in: 0 ... 1), green: .random(in: 0 ... 1), blue: .random(in: 0 ... 1))
    }

#if os(iOS)
    static let systemWhite: Color = .init(UIColor(dynamicProvider: { traitCollection -> UIColor in
        return traitCollection.userInterfaceStyle == .dark ? .black : .white
    }))

    static let systemBlack: Color = .init(UIColor(dynamicProvider: { traitCollection -> UIColor in
        return traitCollection.userInterfaceStyle == .dark ? .white : .black
    }))
#endif
}

#if os(iOS)
@available(iOS 14.0, *)
public extension Color {
    init(light lightModeColor: @escaping @autoclosure () -> Color, dark darkModeColor: @escaping @autoclosure () -> Color) {
        self.init(PlatformColor(light: PlatformColor(lightModeColor()), dark: PlatformColor(darkModeColor())))
    }
}

private extension PlatformColor {
    convenience init(light lightModeColor: @escaping @autoclosure () -> PlatformColor, dark darkModeColor: @escaping @autoclosure () -> PlatformColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light:
                return lightModeColor()
            case .dark:
                return darkModeColor()
            case .unspecified:
                return lightModeColor()
            @unknown default:
                return lightModeColor()
            }
        }
    }
}
#endif
