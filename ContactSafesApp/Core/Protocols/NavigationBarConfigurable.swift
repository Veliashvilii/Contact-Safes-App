//
//  NavigationBarConfigurable.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

protocol NavigationBarConfigurable {
    func configureNavigationBar(title: String, highlightedWord: String?)
}

extension NavigationBarConfigurable {
    func createNavigationTitleLabel(title: String, highlightedWord: String?) -> UILabel {
        let titleLabel = UILabel()
        let attributedText = NSMutableAttributedString(
            string: title,
            attributes: [
                .font: ThemeFont.defaultTheme.titleBoldFont,
                .foregroundColor: ThemeColor.defaultTheme.textColor
            ]
        )
        
        if let highlightedWord = highlightedWord,
           let range = title.range(of: highlightedWord) {
            let nsRange = NSRange(range, in: title)
            attributedText.addAttribute(
                .foregroundColor,
                value: ThemeColor.defaultTheme.primaryColor,
                range: nsRange
            )
        }
        
        titleLabel.attributedText = attributedText
        titleLabel.textAlignment = .center
        return titleLabel
    }
}
