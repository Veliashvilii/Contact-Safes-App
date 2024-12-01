//
//  OnBoardingViewController.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    private var onBoardingView: OnBoardingFirstPageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardingView = OnBoardingFirstPageView(self)
        view = onBoardingView
    }
}
/**
#Preview {
    OnBoardingViewController()
 }
*/
