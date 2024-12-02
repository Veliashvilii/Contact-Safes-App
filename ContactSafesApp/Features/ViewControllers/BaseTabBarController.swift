//
//  BaseTabBarController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = ThemeManager.deafultTheme.colorTheme.primaryColor
        tabBar.unselectedItemTintColor = ThemeManager.deafultTheme.colorTheme.secondaryColor
        tabBar.backgroundColor = .systemBackground
    }
    
    private func setupViewControllers() {
        viewControllers = [
            createNavigationController(for: HomePageViewController(), title: "Home", imageName: "house.fill"),
            createNavigationController(for: MyContactsViewController(), title: "Contacts", imageName: "person.2.fill")
        ]
    }
    
    private func createNavigationController(for rootViewController: UIViewController,
                                          title: String,
                                          imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        rootViewController.navigationItem.title = title
        return navigationController
    }
}
