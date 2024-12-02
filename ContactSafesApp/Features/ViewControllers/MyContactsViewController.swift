//
//  MyContactsViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

class MyContactsViewController: UIViewController {
    
    private var myContactsView: MyContactsView?

    override func viewDidLoad() {
        super.viewDidLoad()
        myContactsView = MyContactsView(self)
        view = myContactsView
    }
}

#Preview {
    MyContactsViewController()
}
