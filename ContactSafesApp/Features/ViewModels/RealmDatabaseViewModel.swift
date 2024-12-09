//
//  RealmDatabaseViewModel.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 4.12.2024.
//

import UIKit
import Contacts
import ContactsUI
import RealmSwift

// MARK: - Protocol
protocol ContactViewModelProtocol: AnyObject {
    var contacts: [Contact] { get }
    var onContactsUpdated: (() -> Void)? { get set }
    
    func fetchContacts()
    func addContact(name: String, phoneNumber: String)
    func deleteContact(at index: Int)
    func handleContactSelection(contact: CNContact)
    func openContactPicker(in viewController: UIViewController)
}

// MARK: - ViewModel Implementation
final class ContactViewModel: NSObject, ContactViewModelProtocol {
    // MARK: - Properties
    private var realm: Realm?
    private(set) var contacts: [Contact] = []
    private let contactService: ContactServiceProtocol
    var onContactsUpdated: (() -> Void)?
    
    // MARK: - Initialization
    init(contactService: ContactServiceProtocol = ContactService()) {
        self.contactService = contactService
        super.init()
        setupRealm()
        fetchContacts()
    }
    
    // MARK: - Private Methods
    private func setupRealm() {
        do {
            realm = try Realm()
        } catch {
            print("Error initializing Realm: \(error)")
        }
    }
    
    private func showAccessDeniedAlert(in viewController: UIViewController) {
        AlertManager.shared.showAlert(
            title: "Contact Access Required",
            subTitle: "Please enable contact access in Settings to use this feature.",
            isQuestion: false
        )
    }
    
    private func showError(_ error: Error, in viewController: UIViewController) {
        AlertManager.shared.showAlert(
            title: "Error",
            subTitle: error.localizedDescription,
            isQuestion: false
        )
    }
    
    // MARK: - Public Methods
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
    
    func openContactPicker(in viewController: UIViewController) {
        contactService.requestAccess { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let granted):
                    if granted {
                        let picker = CNContactPickerViewController()
                        picker.delegate = self
                        viewController.present(picker, animated: true)
                    } else {
                        self?.showAccessDeniedAlert(in: viewController)
                    }
                case .failure(let error):
                    self?.showError(error, in: viewController)
                }
            }
        }
    }
    func handleContactSelection(contact: CNContact) {
        guard let contactInfo = contactService.handleSelectedContact(contact) else {
            // Handle error - could add alert here if needed
            print("Error processing contact information")
            return
        }
        addContact(name: contactInfo.name, phoneNumber: contactInfo.phoneNumber)
    }
}

// MARK: - CNContactPickerDelegate
extension ContactViewModel: CNContactPickerDelegate {
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        handleContactSelection(contact: contact)
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Contact selection cancelled")
    }
}
