// Created by Augus on 2021/10/26
// Copyright © 2021 Augus <iAugux@gmail.com>

import SwiftUI

#if os(iOS) || os(macOS)
@available(iOS 14.0, macOS 11.0, *)
public extension KeyEquivalent {
    /// A convenience KeyEquivalent initializer takes string value.
    /// - Parameter key: The single-character string. key must contain exactly one extended grapheme cluster otherwise it crashes.
    init(_ key: String) {
        self.init(.init(key))
    }
}

@available(iOS 14.0, macOS 11.0, *)
public extension KeyEquivalent {
    #if os(macOS)
    static let deleteCharacter: KeyEquivalent = .init(given(UnicodeScalar(NSDeleteCharacter)) { Character($0) } ?? "k")
    #elseif os(iOS)
    // TODO: - untested, should be tested on iPad with a hardware keyboard.
    static let deleteCharacter: KeyEquivalent = .delete
    #endif
}

@available(iOS 14.0, macOS 11.0, *)
public extension View {
    /// Defines a keyboard shortcut and assigns it to the modified control. This is just a convenience wrapper of `keyboardShortcut(KeyEquivalent:EventModifiers)`.
    /// - Parameters:
    ///   - key: The single-character string. key must contain exactly one extended grapheme cluster otherwise it crashes.
    ///   - modifiers: A set of key modifiers that you can add to a gesture.
    func keyboardShortcut(_ key: String, modifiers: EventModifiers = .command) -> some View {
        let key: KeyEquivalent = .init(key)
        return keyboardShortcut(key, modifiers: modifiers)
    }
}
#endif
