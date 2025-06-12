// Created by Augus on 7/5/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import SwiftUI
#if os(macOS)
import AppKit
#else
import UIKit
#endif

#if os(macOS)
typealias PlatformColor = NSColor
#else
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
    private init(_uiColor: UIColor) {
        if #available(iOS 15.0, *) {
            self.init(uiColor: _uiColor)
        } else {
            self.init(_uiColor)
        }
    }

    static let systemWhite: Color = .init(UIColor(dynamicProvider: { traitCollection -> UIColor in
        return traitCollection.userInterfaceStyle == .dark ? .black : .white
    }))

    static let systemBlack: Color = .init(UIColor(dynamicProvider: { traitCollection -> UIColor in
        return traitCollection.userInterfaceStyle == .dark ? .white : .black
    }))

    /// The color for the main background of your interface.
    /// - Use this color for standard table views and designs that have a white primary background in a light environment.
    static var systemBackground: Color {
        .init(_uiColor: .systemBackground)
    }

    /// The color for content layered on top of the main background.
    /// - Use this color for standard table views and designs that have a white primary background in a light environment.
    static var secondarySystemBackground: Color {
        .init(_uiColor: .secondarySystemBackground)
    }

    /// The color for content layered on top of secondary backgrounds.
    /// - Use this color for standard table views and designs that have a white primary background in a light environment.
    static var tertiarySystemBackground: Color {
        .init(_uiColor: .tertiarySystemBackground)
    }

    /// The color for the main background of your grouped interface.
    /// - Use this color for grouped content, including table views and platter-based designs.
    static var systemGroupedBackground: Color {
        .init(_uiColor: .systemGroupedBackground)
    }

    /// The color for content layered on top of the main background of your grouped interface.
    /// - Use this color for grouped content, including table views and platter-based designs.
    static var secondarySystemGroupedBackground: Color {
        .init(_uiColor: .secondarySystemGroupedBackground)
    }

    /// The color for content layered on top of secondary backgrounds of your grouped interface.
    /// - Use this color for grouped content, including table views and platter-based designs.
    static var tertiarySystemGroupedBackground: Color {
        .init(_uiColor: .tertiarySystemGroupedBackground)
    }

    /// An overlay fill color for thin and small shapes.
    /// - Use system fill colors for items situated on top of an existing background color. System fill colors incorporate transparency to allow the background color to show through.
    /// - Use this color to fill thin or small shapes, such as the track of a slider.
    static var systemFill: Color {
        .init(_uiColor: .systemFill)
    }

    /// An overlay fill color for medium-size shapes.
    /// - Use system fill colors for items situated on top of an existing background color. System fill colors incorporate transparency to allow the background color to show through.
    /// - Use this color to fill medium-size shapes, such as the background of a switch.
    static var secondarySystemFill: Color {
        .init(_uiColor: .secondarySystemFill)
    }

    /// An overlay fill color for large shapes.
    /// - Use system fill colors for items situated on top of an existing background color. System fill colors incorporate transparency to allow the background color to show through.
    /// - Use this color to fill large shapes, such as input fields, search bars, or buttons.
    static var tertiarySystemFill: Color {
        .init(_uiColor: .tertiarySystemFill)
    }

    /// An overlay fill color for large areas that contain complex content.
    /// - Use system fill colors for items situated on top of an existing background color. System fill colors incorporate transparency to allow the background color to show through.
    /// - Use this color to fill large areas that contain complex content, such as an expanded table cell.
    static var quaternarySystemFill: Color {
        .init(_uiColor: .quaternarySystemFill)
    }

    /// The nonadaptable system color for text on a dark background.
    /// - This color doesn’t adapt to changes in the underlying trait environment.
    static var lightText: Color {
        .init(_uiColor: .lightText)
    }

    /// The nonadaptable system color for text on a light background.
    /// - This color doesn’t adapt to changes in the underlying trait environment.
    static var darkText: Color {
        .init(_uiColor: .darkText)
    }
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
