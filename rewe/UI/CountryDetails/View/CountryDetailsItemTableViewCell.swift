//
//  CountryDetailsItemTableViewCell.swift
//  rewe
//
//  Created by Ahmed Madian on 15.03.24.
//

import UIKit

class CountryDetailsItemTableViewCell: UITableViewCell {
    // MARK: - Views

    private let titleLabel = UILabel().with {
        $0.textColor = Assets.Colors.primaryText.color
        $0.font = UIFont.bodyB1Style
        $0.textAlignment = .left
        $0.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    }

    private let subtitleLabel = UILabel().with {
        $0.numberOfLines = .zero
        $0.textColor = Assets.Colors.secondaryText.color
        $0.font = UIFont.captionC1Style
        $0.textAlignment = .left
        $0.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }

    private lazy var labelsContainer = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel]).with {
        $0.axis = .vertical
        $0.spacing = DesignConstants.Padding.small
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
    }

    private func setupViewLayout() {
        contentView.addSubview(labelsContainer)

        labelsContainer.autolayout()
            .topToSuperview(padding: DesignConstants.Padding.small)
            .bottomToSuperview(padding: DesignConstants.Padding.small)
            .leadingToSuperview(padding: DesignConstants.Padding.medium)
            .trailingToSuperview(padding: DesignConstants.Padding.medium)
    }

    // MARK: - Config

    func configCell(with model: CountryDetailsItemModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}
