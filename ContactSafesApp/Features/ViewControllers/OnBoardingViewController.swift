//
//  OnBoardingViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    private var onBoardingView: OnBoardingThirdPageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardingView = OnBoardingThirdPageView(self)
        view = onBoardingView
    }
}

#Preview {
    OnBoardingViewController()
 }
