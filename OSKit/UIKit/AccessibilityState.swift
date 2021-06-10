//
//  AccessibilityState.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import UIKit

public struct AccessibilityState: Equatable, Codable {

    public var label: OSLocalizedString?
    public var hint: OSLocalizedString?
    public var identifier: String?
    public var traits: UIAccessibilityTraits?

    public init(label: OSLocalizedString? = nil, hint: OSLocalizedString? = nil, identifier: String? = nil, traits: UIAccessibilityTraits? = nil) {
        self.label = label
        self.hint = hint
        self.identifier = identifier
        self.traits = traits
    }

}
