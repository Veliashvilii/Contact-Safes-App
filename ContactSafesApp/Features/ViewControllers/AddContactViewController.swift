//
//  AddContactViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

final class AddContactViewController: UIViewController, MainThreadRunner, NavigationView {
    private let viewModel: ContactViewModelProtocol
    private var addContactView: AddContactView?
    
    init(viewModel: ContactViewModelProtocol = ContactViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    private func setupView() {
        addContactView = AddContactView(self)
        addContactView?.contactsTableView.delegate = self
        addContactView?.contactsTableView.dataSource = self
        addContactView?.customDelegate = self
        runOnMain {
            self.view = self.addContactView
        }
    }
    
    private func setupBindings() {
        viewModel.onContactsUpdated = { [weak self] in
            self?.runOnMain {
                self?.addContactView?.contactsTableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate & DataSource
extension AddContactViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as? ContactCell else {
            return UITableViewCell()
        }
        
        let contact = viewModel.contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteContact(at: indexPath.row)
        }
    }
}

// MARK: - AddContactViewDelegate
extension AddContactViewController: AddContactViewDelegate {
    func didTapPickContactButton() {
        print("Will pick to contact...")
    }
    
    func didTappAddContactButton(name: String, phoneNumber: String) {
        viewModel.addContact(name: name, phoneNumber: phoneNumber)
        addContactView?.clearFields()
    }
}
