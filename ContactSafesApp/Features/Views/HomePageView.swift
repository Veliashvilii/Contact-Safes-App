//
//  HomePageView.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 2.12.2024.
//

import UIKit

final class HomePageView: BaseView<HomePageViewController> {
    // MARK: - Delegate
    private lazy var homePageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = BaseOnboardingView.currentTheme.buttonTheme.backgroundColor
        button.titleLabel?.font = BaseOnboardingView.currentTheme.fontTheme.titleBoldFont
        button.titleLabel?.numberOfLines = 2
        let title = "SEND\nMessage"
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = CornerRadius.big.size
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowOpacity = ShadowOpacity.small.size
        button.layer.shadowRadius = ShadowRadius.small.size
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    override func setupView() {
        super.setupView()
        setupLayout()
        setupConstraints()
        setupNavigationBar()
    }

    private func setupLayout() {
        addSubview(homePageButton)
    }

    func setupConstraints() {
        homePageButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }

    private func setupNavigationBar() {
        configureNavigationBar(
            title: NavBarTitle.title.rawValue,
            highlightedWord: NavBarTitle.highlightedWord.rawValue
        )
    }

    // MARK: - Targets
    @objc private func buttonTapped() {
        delegate?.didTapButton()
    }
}
