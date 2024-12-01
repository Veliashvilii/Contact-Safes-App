//
//  CornerRadius.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import Foundation

enum CornerRadius: Int {
    case small = 10
    case medium = 30
    case big = 50
    
    var size: CGFloat {
        CGFloat(self.rawValue)
    }
}
