//
//  MessagePageView.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 9.12.2024.
//

import UIKit
import SnapKit

final class MessagePageView: BaseView<MessagePageViewController> {
    // MARK: - Attributes
    private lazy var topTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Message Templates"
        label.font = AddContactView.currentTheme.fontTheme.titleBoldFont
        label.textColor = AddContactView.currentTheme.colorTheme.textColor
        return label
    }()
    lazy var messagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
        tableView.rowHeight = 70
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    private lazy var messageAddButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Custom Message", for: .normal)
        button.backgroundColor = .primary
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.addTarget(self, action: #selector(messageAddButtonTapped), for: .touchUpInside)
        return button
    }()
    // MARK: - Setup
    override func setupView() {
        super.setupView()
        setupSubviews()
        setupConstraints()
    }
    private func setupSubviews() {
        [topTitleLabel, messagesTableView, messageAddButton].forEach(addSubview(_:))
    }
    private func setupConstraints() {
        let padding: CGFloat = 24
        let buttonHeight: CGFloat = 50
        topTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(padding)
            make.leading.equalToSuperview().offset(padding)
        }
        messagesTableView.snp.makeConstraints { make in
            make.top.equalTo(topTitleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(padding)
            make.bottom.equalTo(messageAddButton.snp.top).offset(-16)
        }
        messageAddButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-padding)
            make.width.equalTo(snp.width).multipliedBy(0.8)
            make.height.equalTo(buttonHeight)
        }
    }
    // MARK: - Targets
    @objc private func messageAddButtonTapped() {
        delegate?.didTapButton()
    }

}
