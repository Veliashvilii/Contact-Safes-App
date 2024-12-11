//
//  MyContactsViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

final class MyContactsViewController: UIViewController, NavigationView, MainThreadRunner {
    private var myContactsView: MyContactsView?

    override func viewDidLoad() {
        super.viewDidLoad()
        myContactsView = MyContactsView(self)
        runOnMain {
            self.view = self.myContactsView
        }
        myContactsView?.customDelegate = self
    }
}

// MARK: - CustomDelegate
extension MyContactsViewController: MyContactsViewDelegate {
    func didAddButtonTapped() {
        runOnMainSafety {  [weak self] in
            print("Switch to Add Contact View Controller")
            let addContactViewController = AddContactViewController()
            self?.present(addContactViewController)
        }
    }
    func didEditButtonTapped() {
        runOnMainSafety { [weak self] in
            print("Switch to Message Page View Controller")
            let messagePageViewController = MessagePageViewController()
            messagePageViewController.delegate = self
            self?.present(messagePageViewController)
        }
    }
}

// MARK: - BaseViewControllerDelegate
extension MyContactsViewController: MessagePageViewControllerDelegate {
    func didSelectMessage(_ message: String) {
        myContactsView?.updateMessageLabel(with: message)
        print("Message Label was updated!")
    }
}
