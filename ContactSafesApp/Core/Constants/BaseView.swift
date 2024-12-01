//
//  BaseView.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

class BaseView<T: UIViewController>: UIView, MainThreadRunner {
    var viewController: T
    
    init(_ viewController: T) {
        self.viewController = viewController
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        backgroundColor = ThemeColor.defaultTheme.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
