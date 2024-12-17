//
//  HomePageViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit
import MessageUI

final class HomePageViewController: UIViewController {
    private var homePageView: HomePageView?
    private let viewModel: ContactViewModelProtocol = ContactViewModel() // ViewModel örneği

    override func viewDidLoad() {
        super.viewDidLoad()
        homePageView = HomePageView(self)
        homePageView?.delegate = self
        view = homePageView
    }
}

extension HomePageViewController: BaseViewDelegate {
    func didTapButton() {
        guard let activeMessage = viewModel.getActiveMessage() else {
            print("No active message selected.")
            return
        }
        let selectedContacts = viewModel.contacts
        print("Selected Contacts: \(selectedContacts)")
        viewModel.sendMessage(to: selectedContacts, message: activeMessage, from: self)
    }
}

// MARK: - MFMessageComposeViewControllerDelegate
extension HomePageViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
        
        switch result {
        case .cancelled:
            print("Message sending cancelled.")
        case .failed:
            print("Message sending failed for an unknown reason.")
        case .sent:
            print("Message sent successfully.")
        @unknown default:
            print("Unknown result.")
        }
    }
}
