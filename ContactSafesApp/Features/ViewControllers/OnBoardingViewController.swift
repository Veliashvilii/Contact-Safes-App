//
//  OnBoardingViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    private var currentPage: OnboardingSlide = .first {
        didSet {
            updateView()
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
        onBoardingView = BaseOnboardingView(self, slide: currentPage)
        onBoardingView?.delegate = self
        view = onBoardingView
    }
}

extension OnBoardingViewController: OnBoardingDelegate {
    func didTapButton(_ view: UIView) {
        switch currentPage {
        case .first:
            currentPage = .second
        case .second:
            currentPage = .third
        case .third:
            // Navigate to next screen
            print("Onboarding completed")
        }
    }
}

#Preview {
    OnBoardingViewController()
}
