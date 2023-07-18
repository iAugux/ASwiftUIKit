// Created by Augus on 6/16/23
// Copyright © 2023 Augus <iAugux@gmail.com>

import Foundation
import SwiftUI

public prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}
