//
//  Contact.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import RealmSwift
import Foundation

final class Contact: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String
    @Persisted var phoneNumber: String
    
    override init() {
        super.init()
    }
    
    init(name: String, phoneNumber: String) {
        super.init()
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
