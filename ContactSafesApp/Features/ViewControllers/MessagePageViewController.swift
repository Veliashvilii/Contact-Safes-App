//
//  MessagePageViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 9.12.2024.
//

import UIKit

protocol MessagePageViewControllerDelegate: AnyObject {
    func didSelectMessage(_ message: String)
}

final class MessagePageViewController: UIViewController, MainThreadRunner {
    private var messageView: MessagePageView?
    private let messages = PresetMessage.groupedMessages
    private var sections: [String] = []
    weak var delegate: MessagePageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageView = MessagePageView(self)
        messageView?.messagesTableView.delegate = self
        messageView?.messagesTableView.dataSource = self
        messageView?.messagesTableView.estimatedRowHeight = 100
        messageView?.messagesTableView.rowHeight = UITableView.automaticDimension
        messageView?.delegate = self
        runOnMain { [weak self] in
            self?.view = self?.messageView
        }
        sections = Array(messages.keys).sorted()
    }
}

// MARK: - Delegate
extension MessagePageViewController: BaseViewDelegate {
    func didTapButton() {
        print("Add Custom Message Button Tapped.")
    }
}

// MARK: - UITableViewDelegate
extension MessagePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        guard let sectionMessages = messages[section] else { return }
        let selectedMessage = sectionMessages[indexPath.row]
        delegate?.didSelectMessage(selectedMessage.message)
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - UITableViewDataSource
extension MessagePageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = sections[section]
        return messages[sectionKey]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MessageCell.identifier,
            for: indexPath
        ) as? MessageCell else {
            return UITableViewCell()
        }
        
        let section = sections[indexPath.section]
        if let sectionMessages = messages[section] {
            let presetMessage = sectionMessages[indexPath.row]
            // PresetMessage'ı Message modeline çeviriyoruz
            let message = Message(text: presetMessage.message, isActiveMessage: false)
            cell.configure(with: message)
        }
        return cell
    }
    
}
