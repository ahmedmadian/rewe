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
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .black
        tabBar.tintColor = .red
        tabBar.isTranslucent = false
    }
}
