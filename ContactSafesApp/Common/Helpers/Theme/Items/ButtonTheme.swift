//
//  ButtonTheme.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

struct ButtonTheme {
    let font: UIFont
    let textColor: UIColor
    let backgroundColor: UIColor
    let maximumLine: Int
}

extension ButtonTheme {
    static var defaultTheme: ButtonTheme {
        return ButtonTheme(
            font: ThemeFont.defaultTheme.titleFont,
            textColor: ThemeColor.defaultTheme.buttonTextColor,
            backgroundColor: ThemeColor.defaultTheme.primaryColor,
            maximumLine: 2
        )
    }
}
