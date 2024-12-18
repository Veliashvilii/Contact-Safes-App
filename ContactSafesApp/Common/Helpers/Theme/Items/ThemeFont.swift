//
//  ThemeFont.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

struct ThemeFont {
    let titleBoldFont: UIFont
    let titleFont: UIFont
    let subTitleFont: UIFont

    private enum CustomFont: String {
        case bold
        case black
        case regular
        case light
        case medium
        static let fontFamily: String = "Poppins"

        func value(fontSize: CustomFontSize) -> UIFont {
            let formattedRawValue = rawValue.prefix(1).uppercased() + rawValue.dropFirst()
            return UIFont(name: "\(CustomFont.fontFamily)-\(formattedRawValue)", size: fontSize.rawValue)!
        }
    }

    private enum CustomFontSize: CGFloat {
        case headline = 24
        case subheadline = 16
    }
}

extension ThemeFont {
    static var defaultTheme: ThemeFont {
        return ThemeFont(
            titleBoldFont: ThemeFont.CustomFont.bold.value(fontSize: .headline),
            titleFont: ThemeFont.CustomFont.medium.value(fontSize: .headline),
            subTitleFont: ThemeFont.CustomFont.regular.value(fontSize: .subheadline)
        )
    }
}
