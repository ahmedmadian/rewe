//
//  ViewControllers+Injection.swift
//  rewe
//
//  Created by Ahmed Madian on 26.02.24.
//

import Swinject

extension Container {
    func registerViewControllers() {
        register(HomeTabBarController.self) { _ in return HomeTabBarController() }
        register(AllCountriesViewController.self) { _ in return AllCountriesViewController() }
        register(RegionalCountriesViewController.self) { _ in return RegionalCountriesViewController() }
    }
}
