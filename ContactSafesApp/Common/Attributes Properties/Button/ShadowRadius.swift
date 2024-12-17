//
//  ShadowRadius.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import Foundation

enum ShadowRadius: Int {
    case small = 10
    case medium = 20
    case large = 30
    var size: CGFloat {
        CGFloat(self.rawValue)
    }
}
