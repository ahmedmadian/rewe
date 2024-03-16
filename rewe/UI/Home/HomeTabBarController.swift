//
//  HomeTabBarController.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import UIKit

class HomeTabBarController: UITabBarController {
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewAppearance()
    }

    // MARK: - Setup

    private func setupViewAppearance() {
        view.backgroundColor = Assets.Colors.primaryBackground.color
        tabBar.tintColor = Assets.Colors.primaryText.color
        tabBar.barTintColor = Assets.Colors.primaryBackground.color
        tabBar.isTranslucent = true
    }
}
