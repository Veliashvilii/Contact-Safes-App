//
//  RealmDatabaseViewModel.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 4.12.2024.
//

import Foundation
import RealmSwift

protocol ContactViewModelProtocol: AnyObject {
    var contacts: [Contact] { get }
    var onContactsUpdated: (() -> Void)? { get set }
    func fetchContacts()
    func addContact(name: String, phoneNumber: String)
    func deleteContact(at index: Int)
}

final class ContactViewModel: ContactViewModelProtocol {
    private var realm: Realm?
    private(set) var contacts: [Contact] = []
    var onContactsUpdated: (() -> Void)?
    init() {
        setupRealm()
        fetchContacts()
    }
    private func setupRealm() {
        do {
            realm = try Realm()
        } catch {
            print("Error initializing Realm: \(error)")
        }
    }
    func fetchContacts() {
        guard let realm = realm else { return }
        let realmContacts = realm.objects(Contact.self)
        contacts = Array(realmContacts)
        onContactsUpdated?()
    }
    func addContact(name: String, phoneNumber: String) {
        guard let realm = realm else { return }
        let contact = Contact(name: name, phoneNumber: phoneNumber)
        do {
            try realm.write {
                realm.add(contact)
                print("Ben yazdım abey gerisi beni bağlamıyo haberin ola.")
            }
            fetchContacts()
        } catch {
            print("Error adding contact: \(error)")
        }
    }
    func deleteContact(at index: Int) {
        guard let realm = realm,
              index < contacts.count else { return }
        let contact = contacts[index]
        do {
            try realm.write {
                realm.delete(contact)
            }
            fetchContacts()
        } catch {
            print("Error deleting contact: \(error)")
        }
    }
}
