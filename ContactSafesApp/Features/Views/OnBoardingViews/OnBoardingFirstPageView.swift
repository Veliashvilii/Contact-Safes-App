//
//  OnBoardingFirstPageView.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit
import SnapKit

final class OnBoardingFirstPageView: BaseView<OnBoardingViewController> {
    
    // MARK: - Delegate
    weak var delegate: OnBoardingDelegate?
    
    // MARK: - Attributes
    private let onBoardingImageView: UIImageView = {
        let imageView = UIImageView(image: .onboardingImage1)
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let onBoardingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = OnboardingSlide.first.title
        label.font = currentTheme.fontTheme.titleBoldFont
        label.textColor = currentTheme.colorTheme.textColor
        label.textAlignment = .center
        return label
    }()
    
    private let onBoardingSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = OnboardingSlide.first.subTitle
        label.numberOfLines = .zero
        label.font = currentTheme.fontTheme.subTitleFont
        label.textAlignment = .center
        return label
    }()
    
    private lazy var onBoardingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = OnBoardingFirstPageView.currentTheme.buttonTheme.backgroundColor
        button.titleLabel?.font = OnBoardingFirstPageView.currentTheme.fontTheme.titleFont
        button.setTitle(OnboardingSlide.first.buttonTitle, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var columnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [onBoardingTitleLabel, onBoardingSubTitleLabel, onBoardingButton])
        stackView.axis = .vertical
        // TODO: Stackview space
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func setupView() {
        super.setupView()
        setupLayout()
        setupConstraints()
    }

    private func setupLayout() {
        addSubview(onBoardingImageView)
        addSubview(columnStackView)
    }

    func setupConstraints() {
        onBoardingImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.65)
            make.width.equalTo(snp.width).multipliedBy(0.8)
        }
        
        columnStackView.snp.makeConstraints { make in
            make.top.equalTo(onBoardingImageView.snp.bottom).offset(20)
            make.left.right.equalTo(onBoardingImageView)
        }
    }
    
    // MARK: - TARGETS
    
    @objc private func buttonTapped() {
        delegate?.didTapButton(self)
    }
}
