//
//  AddContactViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

final class AddContactViewController: UIViewController, MainThreadRunner, NavigationView {
    
    // Add contacts array
    private var contacts: [Contact] = []
    private var addContactView: AddContactView?

    override func viewDidLoad() {
        super.viewDidLoad()
        addContactView = AddContactView(self)
        addContactView?.contactsTableView.delegate = self
        addContactView?.contactsTableView.dataSource = self
        runOnMain {
            self.view = self.addContactView
        }
        
        // Add some sample data
        contacts = [
            Contact(name: "John Doe", phoneNumber: "+1 234 567 89"),
            Contact(name: "Jane Smith", phoneNumber: "+1 987 654 32")
        ]
    }
}

// MARK: - UITableViewDelegate
extension AddContactViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection if needed
        print("Selected contact: \(contacts[indexPath.row].name)")
    }
}

// MARK: - UITableViewDataSource
extension AddContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as? ContactCell else {
            return UITableViewCell()
        }
        
        let contact = contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
    }
}
