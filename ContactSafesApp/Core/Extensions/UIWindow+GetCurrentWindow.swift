//
//  UIWindow+GetCurrentWindow.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

extension UIWindow {
    
    /// Get current window
    static var current: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first(where: \.isKeyWindow)
    }
}
