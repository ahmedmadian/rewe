//
//  RegionalCountriesViewController.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import UIKit

class RegionalCountriesViewController: UIViewController {
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - View Setup

    private func setupView() {
        setupViewAppearance()
    }

    private func setupViewAppearance() {
        view.backgroundColor = .white
        tabBarItem = UITabBarItem(title: "Regional", image: nil, selectedImage: nil)
    }
}
