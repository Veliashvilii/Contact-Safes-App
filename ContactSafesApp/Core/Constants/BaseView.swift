//
//  BaseView.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

class BaseView<T: UIViewController>: UIView {
    var controller: T
    weak var delegate: BaseViewDelegate?

    init(_ controller: T) {
        self.controller = controller
        super.init(frame: .zero)
        backgroundColor = appTheme.colorTheme.backgroundColor
        setupView()
    }
    
    deinit {
        delegate = nil
    }
    
    var appTheme: AppTheme {
        ThemeManager.deafultTheme
    }
    
    static var currentTheme: AppTheme {
        ThemeManager.deafultTheme
    }
    

    func setupView() { }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
