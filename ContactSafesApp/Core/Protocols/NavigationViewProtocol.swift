//
//  NavigationViewProtocol.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

protocol NavigationView {
    func present(_ viewController: UIViewController)
    func dismiss()
}

extension NavigationView where Self: UIViewController {
    func present(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }

    func dismiss() {
        dismiss(animated: true)
    }
}
