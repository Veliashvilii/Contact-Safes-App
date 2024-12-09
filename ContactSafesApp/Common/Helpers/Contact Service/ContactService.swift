//
//  ContactService.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 9.12.2024.
//

import Contacts
import ContactsUI

protocol ContactServiceProtocol {
    func requestAccess(completion: @escaping (Result<Bool, Error>) -> Void)
    func handleSelectedContact(_ contact: CNContact) -> (name: String, phoneNumber: String)?
}

final class ContactService: ContactServiceProtocol {
    enum ContactError: Error {
        case accessDenied
        case noPhoneNumber
        case invalidData
    }
    func requestAccess(completion: @escaping (Result<Bool, Error>) -> Void) {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(granted))
        }
    }
    func handleSelectedContact(_ contact: CNContact) -> (name: String, phoneNumber: String)? {
        let firstName = contact.givenName
        let lastName = contact.familyName
        let fullName = "\(firstName) \(lastName)".trimmingCharacters(in: .whitespaces)
        guard let phoneNumber = contact.phoneNumbers.first?.value.stringValue else { return nil }
        return (fullName, phoneNumber)
    }
}
