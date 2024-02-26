//
//  AllCountriesViewController.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import UIKit

class AllCountriesViewController: UIViewController {
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
        tabBarItem = UITabBarItem(title: "All", image: nil, selectedImage: nil)
    }
}
