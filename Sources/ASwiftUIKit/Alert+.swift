// Created by Augus on 2021/10/6
// Copyright © 2021 Augus <iAugux@gmail.com>

import SwiftUI

public struct AlertContext: Identifiable {
    public let id = UUID()
    public var title: Text
    public var message: Text?
    var primaryButton: Alert.Button?
    var secondaryButton: Alert.Button?
    var dismissButton: Alert.Button?

    public init(title: Text, message: Text? = nil, primaryButton: Alert.Button? = nil, secondaryButton: Alert.Button? = nil) {
        self.title = title
        self.message = message
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }

    public init(title: String, message: String? = nil, primaryButton: Alert.Button? = nil, secondaryButton: Alert.Button? = nil) {
        self.title = .init(title)
        self.message = given(message) { .init($0) }
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }

    public init(title: Text, message: Text? = nil, dismissButton: Alert.Button) {
        self.title = title
        self.message = message
        self.dismissButton = dismissButton
    }

    public init(title: String, message: String? = nil, dismissButton: Alert.Button) {
        self.title = .init(title)
        self.message = given(message) { .init($0) }
        self.dismissButton = dismissButton
    }
}

extension AlertContext {
    public func alertBuilder() -> Alert {
        if let primaryButton, let secondaryButton {
            return Alert(
                title: title,
                message: message,
                primaryButton: primaryButton,
                secondaryButton: secondaryButton
            )
        } else {
            return Alert(title: title, message: message, dismissButton: dismissButton)
        }
    }
}
