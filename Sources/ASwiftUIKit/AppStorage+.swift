// Created by Augus on 3/28/24
// Copyright © 2024 Augus <iAugux@gmail.com>

import SwiftUI

extension Date: RawRepresentable {
    public typealias RawValue = String

    public init?(rawValue: RawValue) {
        guard let data = rawValue.data(using: .utf8), let date = try? JSONDecoder().decode(Date.self, from: data) else {
            return nil
        }
        self = date
    }

    public var rawValue: RawValue {
        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8) else {
            return ""
        }
        return result
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8), let result = try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self), let result = String(data: data, encoding: .utf8) else {
            return "[]"
        }
        return result
    }
}
