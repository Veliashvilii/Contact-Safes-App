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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, view, completion) in
            self?.showDeleteConfirmation(for: indexPath)
            completion(true)
        }
        
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.backgroundColor = .systemRed
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    private func showDeleteConfirmation(for indexPath: IndexPath) {
        let contact = viewModel.contacts[indexPath.row]
        
        let alert = UIAlertController(
            title: "Delete Contact",
            message: "Are you sure you want to delete \(contact.name)?",
            preferredStyle: .alert
        )
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            self?.viewModel.deleteContact(at: indexPath.row)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    
    }
    
    func presentEditAlert(for index: Int) {
        print("Editleriz be güzel abim kasma bu kadar nolursun.")
    }
}

// MARK: - AddContactViewDelegate
extension AddContactViewController: AddContactViewDelegate {
    func didTapPickContactButton() {
        print("Will pick to contact...")
    }
    
    func didTappAddContactButton(name: String, phoneNumber: String) {
        if (ValidatorManager.shared.validatePhoneNumber(phoneNumber: phoneNumber)) {
            viewModel.addContact(name: name, phoneNumber: phoneNumber)
            addContactView?.clearFields()
        } else {
            print("Lütfen Geçerli Bir Telefon Numarası Giriniz!")
            //let image = UIImage(systemName: "exclamationmark.triangle")
            //AlertManager.shared.showAlert(title: "Opps..", subTitle: "Please enter a validate phone number.", image: image)
            AlertManager.shared.showAlert(title: "Opps..", subTitle: "Please enter a validate phone number.", isQuestion: true)
        }
    }
}
