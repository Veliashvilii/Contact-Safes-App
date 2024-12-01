//
//  HomePageViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

class HomePageViewController: UIViewController {
    
    private var homePageView: HomePageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        homePageView = HomePageView(self)
        view = homePageView
    }
}
