//
//  AddContactViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

final class AddContactViewController: UIViewController, MainThreadRunner, NavigationView {
    
    private var addContactView: AddContactView?

    override func viewDidLoad() {
        super.viewDidLoad()
        addContactView = AddContactView(self)
        runOnMain {
            self.view = self.addContactView
        }
    }

}
