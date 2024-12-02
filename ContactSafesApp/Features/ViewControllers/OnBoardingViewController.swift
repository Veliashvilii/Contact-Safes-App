//
//  OnBoardingViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

class OnBoardingViewController: UIViewController, NavigationView, MainThreadRunner {
    
    private var currentPage: OnboardingSlide = .first {
        didSet {
            runOnMainSafety { [weak self] in
                self?.updateView()
            }
        }
    }
    
    private var onBoardingView: BaseOnboardingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialView()
    }
    
    private func setupInitialView() {
        onBoardingView = BaseOnboardingView(self, slide: currentPage)
        onBoardingView?.delegate = self
        view = onBoardingView
    }
    
    private func updateView() {
        runOnMainSafety { [weak self] in
            guard let self = self else { return }
            self.onBoardingView = BaseOnboardingView(self, slide: self.currentPage)
            self.onBoardingView?.delegate = self
            self.view = self.onBoardingView
        }
    }
}

extension OnBoardingViewController: BaseViewDelegate {
    func didTapButton() {
        switch currentPage {
        case .first:
            currentPage = .second
        case .second:
            currentPage = .third
        case .third:
            runOnMainSafety { [weak self] in
                guard let self = self else { return }
                let tabBarController = BaseTabBarController()
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = tabBarController
                    sceneDelegate.window?.makeKeyAndVisible()
                }
            }
        }
    }
}

/**#Preview {
    OnBoardingViewController()
}
*/
