//
//  Message.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 9.12.2024.
//

import Foundation
import RealmSwift

final class Message: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var text: String
    @Persisted var isActiveMessage: Bool = false
    override init() {
        super.init()
    }
    init(text: String, isActiveMessage: Bool?) {
        super.init()
        self.text = text
        if let isActiveMessage = isActiveMessage { self.isActiveMessage = isActiveMessage }
    }
}
