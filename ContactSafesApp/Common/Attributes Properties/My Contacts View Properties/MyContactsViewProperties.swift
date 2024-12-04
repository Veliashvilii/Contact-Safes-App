//
//  MyContactsViewProperties.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import Foundation

enum MyContactsViewProperties: String {
    case topTitle = "Safe Contacts"
    case addButtonTitle = "Add Contact"
    case messageText = "Hi! I need some support right now. Could you please reach out to me?"
    case editButtonTitle = "Edit Message"
    var text: String {
        String(self.rawValue)
    }
}
