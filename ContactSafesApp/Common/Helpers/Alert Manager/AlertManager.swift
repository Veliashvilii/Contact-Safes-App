//
//  AlertManager.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 4.12.2024.
//

import Foundation
import UIKit

// MARK: - Protocol
protocol AlertManagerProtocol {
    func showAlert(title: String, subTitle: String, isQuestion: Bool)
}

//MARK: - Base Code
final class AlertManager {
    public static let shared = AlertManager()
    private init() {}
}

// MARK: - AlertManager Extensions
extension AlertManager: AlertManagerProtocol {
    func showAlert(title: String, subTitle: String, isQuestion: Bool) {
        guard let topViewController = UIWindow.current?.rootViewController?.topMostViewController() else {
            print("No view controller available to present the alert.")
            return
        }

        let alertController = UIAlertController(title: title, message: subTitle, preferredStyle: .alert)
        
        if (isQuestion) {
            alertController.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        } else {
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        topViewController.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UIViewController Extension
private extension UIViewController {
    func topMostViewController() -> UIViewController {
        if let presentedViewController = self.presentedViewController {
            return presentedViewController.topMostViewController()
        }
        return self
    }
}
