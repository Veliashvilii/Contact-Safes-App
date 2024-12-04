//
//  MyContactsView.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

final class MyContactsView: BaseView<MyContactsViewController> {
    // MARK: - Delegate
    weak var customDelegate: MyContactsViewDelegate?
    // MARK: - Attributes
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.alignment = .fill
        return stack
    }()
    private lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = MyContactsViewProperties.topTitle.text
        label.font = MyContactsView.currentTheme.fontTheme.titleBoldFont
        label.textColor = MyContactsView.currentTheme.colorTheme.textColor
        label.numberOfLines = .zero
        label.textAlignment = .left
        return label
    }()
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primary
        button.titleLabel?.font = MyContactsView.currentTheme.fontTheme.subTitleFont
        button.setTitle(MyContactsViewProperties.addButtonTitle.text, for: .normal)
        button.titleLabel?.textColor = MyContactsView.currentTheme.buttonTheme.textColor
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = CornerRadius.small.size
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    private let messageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = CornerRadius.small.size
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = ShadowOpacity.small.size
        view.layer.shadowRadius = ShadowRadius.small.size
        return view
    }()
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = MyContactsViewProperties.messageText.text
        label.textColor = .primary
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    private let editMessageButton: UIButton = {
        let button = UIButton()
        button.setTitle(MyContactsViewProperties.editButtonTitle.text, for: .normal)
        button.setTitleColor(MyContactsView.currentTheme.buttonTheme.backgroundColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(editMessageButtonTapped), for: .touchUpInside)
        return button
    }()
    // MARK: - Setup
    override func setupView() {
        super.setupView()
        delegate = nil
        setupNavigationBar()
        setupLayout()
        setupConstraints()
    }
    deinit {
        customDelegate = nil
    }
    private func setupLayout() {
        addSubview(mainStackView)
        [topTitleLabel, addButton, messageView].forEach {
            mainStackView.addArrangedSubview($0)
        }
        messageView.addSubview(messageLabel)
        messageView.addSubview(editMessageButton)
    }
    private func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        addButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        messageLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        editMessageButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(12)
            make.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    private func setupNavigationBar() {
        configureNavigationBar(
            title: NavBarTitle.title.rawValue,
            highlightedWord: NavBarTitle.highlightedWord.rawValue
        )
    }
    // MARK: - TARGETS
    @objc private func addButtonTapped() {
        customDelegate?.didAddButtonTapped()
    }
    @objc private func editMessageButtonTapped() {
        customDelegate?.didEditButtonTapped()
    }
}
