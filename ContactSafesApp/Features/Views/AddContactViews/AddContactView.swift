//
//  AddContactView.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit
import SnapKit

final class AddContactView: BaseView<AddContactViewController> {
    // MARK: - Delegate
    weak var customDelegate: AddContactViewDelegate?
    // MARK: - UI Elements
    private lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Safe Contacts"
        label.font = AddContactView.currentTheme.fontTheme.titleBoldFont
        label.textColor = AddContactView.currentTheme.colorTheme.textColor
        return label
    }()
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Contact Name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowRadius = 4
        return textField
    }()
    private lazy var pickContactButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        button.tintColor = .primary
        return button
    }()
    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone Number"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowOpacity = 0.1
        textField.layer.shadowRadius = 4
        textField.keyboardType = .phonePad
        return textField
    }()
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Contact", for: .normal)
        button.backgroundColor = .primary
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var safePeopleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Safe Contacts"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .primary
        return label
    }()
    lazy var contactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(ContactCell.self, forCellReuseIdentifier: ContactCell.identifier)
        tableView.rowHeight = 70
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    // MARK: - Setup
    override func setupView() {
        super.setupView()
        setupSubviews()
        setupConstraints()
    }
    private func setupSubviews() {
        [topTitleLabel, nameTextField, pickContactButton, phoneTextField,
         addButton, safePeopleLabel, contactsTableView].forEach(addSubview(_:))
    }
    private func setupConstraints() {
        let padding: CGFloat = 24
        let textFieldHeight: CGFloat = 56
        let buttonHeight: CGFloat = 50
        topTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(padding)
            make.leading.equalToSuperview().offset(padding)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(topTitleLabel.snp.bottom).offset(padding)
            make.leading.equalToSuperview().offset(padding)
            make.height.equalTo(textFieldHeight)
        }
        pickContactButton.snp.makeConstraints { make in
            make.centerY.equalTo(nameTextField)
            make.leading.equalTo(nameTextField.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(padding)
            make.width.height.equalTo(textFieldHeight)
        }
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(textFieldHeight)
        }
        addButton.snp.makeConstraints { make in
            make.top.equalTo(phoneTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(buttonHeight)
        }
        safePeopleLabel.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(padding)
        }
        contactsTableView.snp.makeConstraints { make in
            make.top.equalTo(safePeopleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(padding)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    @objc private func addButtonTapped() {
        guard let name = nameTextField.text, let phoneNumber = phoneTextField.text else {
            print("ERRROOOOOOOORORRRRR!!.1!:1:1")
            print("From Adding button.")
            print("Show Alert for name or phone number")
            return
        }
        customDelegate?.didTappAddContactButton(name: name, phoneNumber: phoneNumber)
    }
    // MARK: - Public Methods
    func clearFields() {
        nameTextField.text = ""
        phoneTextField.text = ""
    }
}
