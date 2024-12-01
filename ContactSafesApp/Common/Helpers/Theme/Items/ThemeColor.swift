//
//  ThemeColor.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

struct ThemeColor {
    let primaryColor: UIColor
    let secondaryColor: UIColor
    let errorColor: UIColor
    let textColor: UIColor
}

extension ThemeColor {
    static var defaultTheme: ThemeColor {
        return ThemeColor(
            primaryColor: .systemMint,
            secondaryColor: .darkGray,
            errorColor: .red,
            textColor: .blue
        )
    }
}
