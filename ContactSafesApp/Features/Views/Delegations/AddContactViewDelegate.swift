//
//  AddContactViewDelegate.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 4.12.2024.
//

import Foundation

protocol AddContactViewDelegate: AnyObject {
    func didTapPickContactButton()
    func didTappAddContactButton(name: String, phoneNumber: String)
}
