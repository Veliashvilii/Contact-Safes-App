//
//  BaseOnboardingView.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 1.12.2024.
//

import UIKit
import SnapKit

final class BaseOnboardingView: BaseView<OnBoardingViewController> {
    // MARK: - Properties
    private let slide: OnboardingSlide
    // MARK: - UI Components
    private lazy var imageContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = CornerRadius.big.size
        view.clipsToBounds = true
        view.backgroundColor = .systemBackground
        return view
    }()
    private lazy var onBoardingImageView: UIImageView = {
        let imageView = UIImageView(image: slide.image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var onBoardingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = slide.title
        label.font = BaseOnboardingView.currentTheme.fontTheme.titleBoldFont
        label.textColor = BaseOnboardingView.currentTheme.colorTheme.textColor
        label.numberOfLines = .zero
        label.textAlignment = .center
        return label
    }()
    private lazy var onBoardingSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = slide.subTitle
        label.numberOfLines = .zero
        label.font = BaseOnboardingView.currentTheme.fontTheme.subTitleFont
        label.textAlignment = .center
        return label
    }()
    private lazy var onBoardingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = BaseOnboardingView.currentTheme.buttonTheme.backgroundColor
        button.titleLabel?.font = BaseOnboardingView.currentTheme.fontTheme.titleFont
        button.setTitle(slide.buttonTitle, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = CornerRadius.small.size
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var columnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [onBoardingTitleLabel, onBoardingSubTitleLabel, onBoardingButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        return stackView
    }()
    // MARK: - Init
    init(_ controller: OnBoardingViewController, slide: OnboardingSlide) {
        self.slide = slide
        super.init(controller)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup
    override func setupView() {
        super.setupView()
        setupLayout()
        setupConstraints()
    }
    private func setupLayout() {
        addSubview(imageContainerView)
        imageContainerView.addSubview(onBoardingImageView)
        addSubview(columnStackView)
    }
    private func setupConstraints() {
        imageContainerView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(snp.width).multipliedBy(0.8)
            make.height.equalTo(imageContainerView.snp.width)
        }
        onBoardingImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        columnStackView.snp.makeConstraints { make in
            make.top.equalTo(imageContainerView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(20)
        }
    }
    // MARK: - Actions
    @objc private func buttonTapped() {
        delegate?.didTapButton()
    }
}
