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
            font: <#T##UIFont#>,
            textColor: <#T##UIColor#>,
            backgroundColor: <#T##UIColor#>,
            maximumLine: <#T##Int#>
        )
    }
}
