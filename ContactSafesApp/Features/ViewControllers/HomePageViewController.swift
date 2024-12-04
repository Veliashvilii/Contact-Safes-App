//
//  HomePageViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

final class HomePageViewController: UIViewController {
    
    private var homePageView: HomePageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        homePageView = HomePageView(self)
        homePageView?.delegate = self
        view = homePageView
    }
}

extension HomePageViewController: BaseViewDelegate {
    func didTapButton() {
        // TODO: - Will Send Messages
        print("Will Send Messages")
    }
}
