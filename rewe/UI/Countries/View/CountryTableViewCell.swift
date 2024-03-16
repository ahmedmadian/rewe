//
//  CountryTableViewCell.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import UIKit
import AlamofireImage

class CountryTableViewCell: UITableViewCell {
    private enum Constants {
        static let imageViewWidth: CGFloat = 100
        static let imageViewHeight: CGFloat = imageViewWidth / 2
    }
    
    // MARK: - Views

    let containerView = UIView().with {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = DesignConstants.CornerRadius.standard
    }

    private let flagImageView = UIImageView(image: Assets.Images.flagPlaceholder.image).with {
        $0.contentMode = .center
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = Assets.Colors.primaryText.color.cgColor
        $0.layer.cornerRadius = DesignConstants.CornerRadius.standard
    }

    private let titleLabel = UILabel().with {
        $0.numberOfLines = .zero
        $0.textColor = Assets.Colors.primaryText.color
        $0.font = UIFont.bodyB1Style
        $0.textAlignment = .center
        $0.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    }

    private let subtitleLabel = UILabel().with {
        $0.numberOfLines = .zero
        $0.textColor = Assets.Colors.secondaryText.color
        $0.font = UIFont.captionC1Style
        $0.textAlignment = .center
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }

    private lazy var labelsContainer = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel]).with {
        $0.axis = .vertical
        $0.spacing = DesignConstants.Padding.extraSmall
    }

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewSetup

    private func setupView() {
        setupViewAppearance()
        setupViewLayout()
    }

    private func setupViewAppearance() {
        selectionStyle = .none
        backgroundColor = Assets.Colors.primaryBackground.color
        contentView.backgroundColor = Assets.Colors.primaryBackground.color
    }

    private func setupViewLayout() {
        contentView.addSubview(containerView)

        [flagImageView, labelsContainer].forEach {
            containerView.addSubview($0)
        }

        containerView.autolayout()
            .topToSuperview(padding: DesignConstants.Padding.small)
            .bottomToSuperview(padding: DesignConstants.Padding.small)
            .leadingToSuperview(padding: DesignConstants.Padding.medium)
            .trailingToSuperview(padding: DesignConstants.Padding.medium)

        flagImageView.autolayout()
            .widthEqual(toConstant: Constants.imageViewWidth)
            .heightEqual(toConstant: Constants.imageViewHeight)
            .centerY(to: labelsContainer)
            .leadingToSuperview(padding: DesignConstants.Padding.medium)

        labelsContainer.autolayout()
            .after(flagImageView, padding: DesignConstants.Padding.medium)
            .trailingToSuperview(padding: DesignConstants.Padding.medium)
            .topToSuperview(padding:  DesignConstants.Padding.medium)
            .bottomToSuperview(padding:  DesignConstants.Padding.medium)
    }

    // MARK: - Config

    func config(with country: Country) {
        titleLabel.text = country.name.common
        subtitleLabel.text = country.name.official

        guard let flagURL = URL(string: country.flags.png) else { return }

        flagImageView.af.setImage(withURL: flagURL,
                                  cacheKey: country.flags.png,
                                  imageTransition: .crossDissolve(0.3),
                                  runImageTransitionIfCached: false)
    }
}
