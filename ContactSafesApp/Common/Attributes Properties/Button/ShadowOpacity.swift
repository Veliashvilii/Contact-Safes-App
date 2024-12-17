//
//  ShadowOpacity.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import Foundation

enum ShadowOpacity: CGFloat {
    case small = 0.3
    case medium = 0.6
    case large = 0.9
    var size: Float {
        Float(self.rawValue)
    }
}
