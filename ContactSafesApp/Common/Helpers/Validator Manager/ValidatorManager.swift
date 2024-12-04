//
//  ValidatorManager.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 4.12.2024.
//

import Foundation

// MARK: - Protocol
protocol ValidatorManagerProtocol {
    func validatePhoneNumber(phoneNumber: String) -> Bool
}

// MARK: - Base Code
final class ValidatorManager {
    public static let shared = ValidatorManager()
    private init() {}
}

// MARK: - Phone Number Validate
extension ValidatorManager: ValidatorManagerProtocol {
    func validatePhoneNumber(phoneNumber: String) -> Bool {
        // Regex for phone number validation
        let phoneRegex = "^[+]?[0-9]{10,15}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
}
