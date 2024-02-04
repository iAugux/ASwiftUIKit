//  SwiftUI+.swift
//  Created by Augus <iAugux@gmail.com>.
//  Copyright © 2020 iAugus. All rights reserved.

import SwiftUI
#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

// MARK: - Binding Extensions
public extension Binding {
    /// When the `Binding`'s `wrappedValue` changes, the given closure is executed.
    /// - Parameter closure: Chunk of code to execute whenever the value changes.
    /// - Returns: New `Binding`.
    func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            wrappedValue
        }, set: { newValue in
            wrappedValue = newValue
            closure()
        })
    }
}

// MARK: - View Extensions
#if os(macOS)
public extension View {
    var hostingController: NSViewController {
        NSHostingController(rootView: self)
    }

    var nsView: NSView {
        let view: NSView = NSHostingController(rootView: self).view
#if os(iOS)
        view.backgroundColor = .clear
#endif
        return view
    }
}

#elseif os(iOS)
public extension View {
    var hostingController: UIViewController {
        UIHostingController(rootView: self)
    }

    var uiView: UIView {
        let view: UIView = UIHostingController(rootView: self).view
        view.backgroundColor = .clear
        return view
    }

    @ViewBuilder
    func compatibleGroupedListStyle() -> some View {
        if #available(iOS 14.0, *) {
            listStyle(InsetGroupedListStyle())
        } else {
            environment(\.horizontalSizeClass, .regular).listStyle(GroupedListStyle())
        }
    }
}
#endif

public extension View {
    @ViewBuilder
    func `if`(_ conditional: Bool, content: (Self) -> some View) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}

public extension View {
    /// If condition is met, apply modifier, otherwise, leave the view untouched
    @ViewBuilder
    func conditionalModifier(_ condition: Bool, _ modifier: some ViewModifier) -> some View {
        if condition {
            self.modifier(modifier)
        } else {
            self
        }
    }

    /// Apply trueModifier if condition is met, or falseModifier if not.
    @ViewBuilder
    func conditionalModifier(_ condition: Bool, _ trueModifier: some ViewModifier, _ falseModifier: some ViewModifier) -> some View {
        if condition {
            self.modifier(trueModifier)
        } else {
            self.modifier(falseModifier)
        }
    }
}

#if os(iOS)
// MARK: - Corner Radius
public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

private struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> SwiftUI.Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return SwiftUI.Path(path.cgPath)
    }
}
#endif

#if os(iOS)
public extension PreviewDevice {
    static let mac = PreviewDevice(rawValue: "Mac")
    static let iPhone7 = PreviewDevice(rawValue: "iPhone 7")
    static let iPhone7Plus = PreviewDevice(rawValue: "iPhone 7 Plus")
    static let iPhone8 = PreviewDevice(rawValue: "iPhone 8")
    static let iPhone8Plus = PreviewDevice(rawValue: "iPhone 8 Plus")
    static let iPhoneSE = PreviewDevice(rawValue: "iPhone SE")
    static let iPhoneX = PreviewDevice(rawValue: "iPhone X")
    static let iPhoneXs = PreviewDevice(rawValue: "iPhone Xs")
    static let iPhoneXsMax = PreviewDevice(rawValue: "iPhone Xs Max")
    static let iPhoneXʀ = PreviewDevice(rawValue: "iPhone Xʀ")
    static let iPadMini4 = PreviewDevice(rawValue: "iPad mini 4")
    static let iPadAir2 = PreviewDevice(rawValue: "iPad Air 2")
    static let iPadPro9_7Inch = PreviewDevice(rawValue: "iPad Pro (9.7-inch)")
    static let iPadPro12_9Inch = PreviewDevice(rawValue: "iPad Pro (12.9-inch)")
    static let iPad5thGeneration = PreviewDevice(rawValue: "iPad (5th generation)")
    static let iPadPro12_9Inch2ndGeneration = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (2nd generation)")
    static let iPadPro10_5Inch = PreviewDevice(rawValue: "iPad Pro (10.5-inch)")
    static let iPad6ThGeneration = PreviewDevice(rawValue: "iPad (6th generation)")
    static let iPadPro11Inch = PreviewDevice(rawValue: "iPad Pro (11-inch)")
    static let iPadPro12_9Inch3rdGeneration = PreviewDevice(rawValue: "iPad Pro (12.9-inch) (3rd generation)")
    static let iPadMini5ThGeneration = PreviewDevice(rawValue: "iPad mini (5th generation)")
    static let iPadAir3rdGeneration = PreviewDevice(rawValue: "iPad Air (3rd generation)")
    static let appleTV = PreviewDevice(rawValue: "Apple TV")
    static let appleTV4K = PreviewDevice(rawValue: "Apple TV 4K")
    static let appleTV4KAt1080p = PreviewDevice(rawValue: "Apple TV 4K (at 1080p)")
    static let appleWatchSeries238mm = PreviewDevice(rawValue: "Apple Watch Series 2 - 38mm")
    static let appleWatchSeries242mm = PreviewDevice(rawValue: "Apple Watch Series 2 - 42mm")
    static let appleWatchSeries338mm = PreviewDevice(rawValue: "Apple Watch Series 3 - 38mm")
    static let appleWatchSeries342mm = PreviewDevice(rawValue: "Apple Watch Series 3 - 42mm")
    static let appleWatchSeries440mm = PreviewDevice(rawValue: "Apple Watch Series 4 - 40mm")
    static let appleWatchSeries444mm = PreviewDevice(rawValue: "Apple Watch Series 4 - 44mm")
}
#endif
